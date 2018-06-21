/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.management_controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.bean.Mailer;
import model.hibernate.dao.dao_adminaccount;
import model.hibernate.dao.dao_employee;
import model.hibernate.dao.dao_performance;
import model.hibernate.pojo.Adminaccount;
import model.hibernate.pojo.Employee;
import model.resource.performance.PerformanceResultEmployee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author WIN 10
 */
@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private Mailer mailer;

    @RequestMapping(params = "account", method = RequestMethod.POST)
    public String login_with_account(@RequestParam("loginname") String loginname, @RequestParam("password") String password, HttpServletRequest request, HttpSession session) {
        int admin_account_id = dao_adminaccount.check_login(loginname, password);
        if (admin_account_id > 0) {
            Employee current_admin_employee = dao_employee.get_employee_by_id(admin_account_id);

            List<Employee> employees = dao_employee.get_employees_list();
            List<PerformanceResultEmployee> employees_result_list = new ArrayList<>();
            List<PerformanceResultEmployee> top_10 = new ArrayList<>();
            employees.forEach(employee -> {
                int employeeId = employee.getEmployeeId();
                String employeeAvatar = employee.getEmployeeAvatar();
                String employeeName = employee.getEmployeeName();
                String departmentName = employee.getDepartment().getDepartmentName();
                int totalDownvotes = dao_performance.get_total_downvote_of_employee(employeeId);
                int totalUpvotes = dao_performance.get_total_upvote_of_employee(employeeId);
                int result = totalDownvotes * -1 + totalUpvotes * 1;
                PerformanceResultEmployee employee_result = new PerformanceResultEmployee(employeeId, employeeAvatar, employeeName, departmentName, totalDownvotes, totalUpvotes, result);
                employees_result_list.add(employee_result);
            });
            Collections.sort(employees_result_list);
            for (int i = 0; i < 10; i++) {
                top_10.add(employees_result_list.get(i));
            }
            request.setAttribute("employees_result_list", top_10);
            request.setAttribute("employee_index", 1);

            session.setAttribute("current_admin_avatar", current_admin_employee.getEmployeeAvatar());
            session.setAttribute("current_admin_name", current_admin_employee.getEmployeeName());
            session.setAttribute("admin_account_id", admin_account_id);
            return "management/home";
        } else {
            request.setAttribute("login_message", "Invalid Login name or password.");
            return "management/login";
        }
    }

    @RequestMapping(value = "/forget_password", method = RequestMethod.GET)
    public String show_forget_password() {
        return "management/forget_password";
    }

    @RequestMapping(value = "/forget_password", method = RequestMethod.POST, params = "reset_password")
    public String reset_password(@RequestParam(value = "email", defaultValue = " ") String email, HttpServletRequest request) {
        Adminaccount account = dao_adminaccount.get_account_by_email(email);
        if (account != null) {
            String new_password = get_salt_string();
            account.setAccountPassword(new_password);
            if (dao_adminaccount.update_account(account)) {
                mailer.send_password(email, new_password);
            }
            request.setAttribute("login_message", "Your password has been reset.");
        } else {
            request.setAttribute("login_message", "Invalid Email.");
        }
        return "management/forget_password";
    }

    @RequestMapping(value = "/forget_password", method = RequestMethod.POST, params = "back_to_login")
    public String back_to_login() {
        return "management/login";
    }

    @RequestMapping("logout")
    public String logout(HttpSession session) {
        session.setAttribute("admin_account_id", 0);
        return "management/login";
    }

    private static String get_salt_string() {
        final String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
        StringBuilder salt = new StringBuilder();
        Random random = new Random();
        while (salt.length() < 18) {
            int index = (int) (random.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String salt_string = salt.toString();
        return salt_string;
    }
}
