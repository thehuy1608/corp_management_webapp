/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.management_controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import model.hibernate.dao.dao_administrator;
import model.hibernate.dao.dao_employee;
import model.hibernate.dao.dao_performance;
import model.hibernate.pojo.Administrator;
import model.hibernate.pojo.Employee;
import model.hibernate.pojo.Performance;
import model.resource.performance.PerformanceRateResource;
import model.resource.performance.PerformanceRateResourceAssembler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.ExposesResourceFor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author WIN 10
 */
@RestController
@ExposesResourceFor(Performance.class)
@RequestMapping(value = "/performance_rate", produces = "application/json")
public class PerformanceRateRESTController {

    @Autowired
    private PerformanceRateResourceAssembler assembler;

    //Create a performance rate
    @RequestMapping(method = RequestMethod.POST, consumes = "application/json")
    public ResponseEntity<PerformanceRateResource> create_performance(@RequestBody PerformanceRateResource performance_resource) {
        Administrator administrator = dao_administrator.get_administrator_by_id(performance_resource.getAdministratorId());
        Employee employee = dao_employee.get_employee_by_id(performance_resource.getEmployeeID());
        Performance performance = new Performance(
                administrator,
                employee,
                performance_resource.getPerformanceResult(),
                performance_resource.getPerformanceDescription(),
                performance_resource.getPerformanceAddedDate(),
                performance_resource.getPerformanceModifiedDate()
        );
        boolean is_created_performance = dao_performance.add_performance(performance);
        if (is_created_performance) {
            return new ResponseEntity<>(assembler.to_resource(performance), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    //Search employee by name
    @RequestMapping(params = {"page", "employee_search_name", "entries"}, method = RequestMethod.GET)
    public ModelAndView get_employees(@RequestParam(value = "employee_search_name", required = false, defaultValue = " ") String employee_search_name, @RequestParam(value = "page", defaultValue = "1") Integer page, @RequestParam(value = "entries", defaultValue = "5") Integer entries, HttpServletRequest request) {
        employee_search_name = employee_search_name.trim();
        int total_result;
        int total_pages;
        int first_result = (page - 1) * entries;
        List<Employee> employees_list;
        if (employee_search_name.isEmpty()) {
            employees_list = dao_employee.get_employees_list(first_result, entries);
            total_result = dao_employee.get_total_employees();
            if (total_result % entries == 0) {
                total_pages = total_result / entries;
            } else {
                total_pages = total_result / entries + 1;
            }
        } else {
            employees_list = dao_employee.get_employees_list(employee_search_name, first_result, entries);
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
            request.setAttribute("employees_list", employees_list);
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
        return new ModelAndView("management/performance_rate");
    }
}
