/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.redirect_controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.hibernate.dao.dao_employee;
import model.hibernate.dao.dao_performance;
import model.hibernate.pojo.Employee;
import model.resource.performance.PerformanceResultEmployee;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author WIN 10
 */
@Controller
@RequestMapping("/management")
public class RedirectController {

    @RequestMapping
    public String show_login(HttpSession session) {
        session.setAttribute("admin_account_id", 0);
        return "management/login";
    }

    @RequestMapping("/department")
    public String show_department() {
        return "management/department";
    }

    @RequestMapping("/employee")
    public String show_employee() {
        return "management/employee";
    }

    @RequestMapping("/performance_rate")
    public String show_performance_rate() {
        return "management/performance_rate";
    }

    @RequestMapping("/performance_result")
    public String show_performance_result(HttpSession session) {
        session.setAttribute("current_result_page", "employees_result");
        return "management/performance_result";
    }
    
    @RequestMapping("/chart") 
    public String show_chart() {
        return "management/chart";
    }

    @RequestMapping("/home")
    public String show_home(HttpServletRequest request) {
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
        return "management/home";
    }
}
