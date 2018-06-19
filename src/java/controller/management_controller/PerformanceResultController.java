/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.management_controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.hibernate.dao.dao_department;
import model.hibernate.dao.dao_employee;
import model.hibernate.dao.dao_performance;
import model.hibernate.pojo.Department;
import model.hibernate.pojo.Employee;
import model.resource.performance.PerformanceResultDepartment;
import model.resource.performance.PerformanceResultEmployee;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author WIN 10
 */
@Controller
@RequestMapping("/performance_result")
public class PerformanceResultController {

    //Search result employee's name
    @RequestMapping(value = "/employee", params = {"page", "employee_search_name", "entries"}, method = RequestMethod.GET)
    public ModelAndView get_employees_result(@RequestParam(value = "employee_search_name", required = false, defaultValue = " ") String employee_search_name, @RequestParam(value = "page", defaultValue = "1") Integer page, @RequestParam(value = "entries", defaultValue = "5") Integer entries, HttpServletRequest request, HttpSession session) {
        employee_search_name = employee_search_name.trim();
        int total_result;
        int total_pages;
        int first_result = (page - 1) * entries;
        List<Employee> employees_list;
        List<PerformanceResultEmployee> employees_result_list;
        if (employee_search_name.isEmpty()) {
            employees_result_list = new ArrayList<>();
            employees_list = dao_employee.get_employees_list(first_result, entries);
            employees_list.forEach(employee -> {
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
            total_result = dao_employee.get_total_employees();
            if (total_result % entries == 0) {
                total_pages = total_result / entries;
            } else {
                total_pages = total_result / entries + 1;
            }
        } else {
            employees_result_list = new ArrayList<>();
            employees_list = dao_employee.get_employees_list(employee_search_name, first_result, entries);
            employees_list.forEach(employee -> {
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
            total_result = dao_employee.get_total_employees(employee_search_name);
            if (total_result % 5 == 0) {
                total_pages = total_result / entries;
            } else {
                total_pages = total_result / entries + 1;
            }
        }

        if (page < 1) {
            //DO-NOTHING WHEN page < 1;
        } else if (page <= total_pages) {
            request.setAttribute("employees_result_list", employees_result_list);
            request.setAttribute("employee_index", page * entries - entries + 1);
            request.setAttribute("total_pages", total_pages);
            request.setAttribute("current_page_number", page);
            request.setAttribute("total_result", total_result);
            request.setAttribute("current_search_name", employee_search_name);
            request.setAttribute("entries", entries);
        } else {
            //TO-DO WHEN page > total pages: SET page = 1
            page = 1;
            request.setAttribute("employees_list", employees_list);
            request.setAttribute("employee_index", page * entries - entries + 1);
            request.setAttribute("total_pages", total_pages);
            request.setAttribute("current_page_number", page);
            request.setAttribute("total_result", total_result);
            request.setAttribute("current_search_name", employee_search_name);
            request.setAttribute("entries", entries);
        }
        session.setAttribute("current_result_page", "employees_result");
        return new ModelAndView("management/performance_result");
    }

    //Search result by department's name
    @RequestMapping(value = "/department", params = "department_search_name")
    public ModelAndView get_departments_result(@RequestParam(value = "department_search_name", defaultValue = " ") String department_search_name, HttpServletRequest request, HttpSession session) {
        department_search_name = department_search_name.trim();
        List<Department> departments = dao_department.get_departments_list(department_search_name);
        if (!departments.isEmpty()) {
            List<PerformanceResultDepartment> departments_result_list = new ArrayList<>();
            departments.forEach(department -> {
                int departmentId = department.getDepartmentId();
                String departmentName = department.getDepartmentName();
                int totalEmployees = dao_department.get_department_total_employees(department);
                int totalDownvotes = dao_performance.get_total_downvote_of_department(departmentId);
                int totalUpvotes = dao_performance.get_total_upvote_of_department(departmentId);
                int result = totalDownvotes * -1 + totalUpvotes * 1;
                PerformanceResultDepartment performance_result = new PerformanceResultDepartment(departmentName, totalEmployees,totalDownvotes, totalUpvotes, result);
                departments_result_list.add(performance_result);
                request.setAttribute("current_department_index", 1);
                request.setAttribute("departments_result_list", departments_result_list);
            });
        }
        session.setAttribute("current_result_page", "departments_result");
        return new ModelAndView("management/performance_result");
    }
}
