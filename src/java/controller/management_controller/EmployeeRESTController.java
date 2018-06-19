/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.management_controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.Serializable;
import java.util.Base64;
import java.util.Collection;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import model.hibernate.dao.dao_branch;
import model.hibernate.dao.dao_department;
import model.hibernate.dao.dao_employee;
import model.hibernate.pojo.Branch;
import model.hibernate.pojo.Department;
import model.hibernate.pojo.Employee;
import model.resource.employee.EmployeeResource;
import model.resource.employee.EmployeeResourceAssembler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.ExposesResourceFor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
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
@ExposesResourceFor(Employee.class)
@RequestMapping(value = "/employee", produces = "application/json")
public class EmployeeRESTController implements Serializable {

    @Autowired
    private EmployeeResourceAssembler assembler;

    @Autowired
    static ServletContext context;

    //Retrieve all employees
    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<Collection<EmployeeResource>> get_employees() {
        List<Employee> employees_list = dao_employee.get_employees_list();
        return new ResponseEntity<>(assembler.to_resource_collection(employees_list), HttpStatus.OK);
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
        return new ModelAndView("management/employee");
    }

    //Create an employee
    @RequestMapping(method = RequestMethod.POST, consumes = "application/json")
    public ResponseEntity<EmployeeResource> create_employee(@RequestBody EmployeeResource employee_resource) {
        Department department = dao_department.get_department_by_id(employee_resource.getDepartmentId());
        Branch branch = dao_branch.get_branch_by_id(employee_resource.getBranchId());
        String avatar_file_name = "/assets/images/avatar/" + write_image_to_context_repository(employee_resource.getEmployeeAvatar());
        Employee employee = new Employee(
                branch,
                department,
                employee_resource.getEmployeeName(),
                employee_resource.getEmployeeGender(),
                avatar_file_name,
                employee_resource.getEmployeeDateOfBirth(),
                employee_resource.getEmployeeSalary(),
                employee_resource.getEmployeeLevel(),
                employee_resource.getEmployeePhoneNumber(),
                employee_resource.getEmployeeEmail(),
                employee_resource.getEmployeeDescription(),
                employee_resource.getModifiedDate()
        );
        boolean is_created_employee = dao_employee.add_employee(employee);
        if (is_created_employee) {
            return new ResponseEntity<>(assembler.to_resource(employee), HttpStatus.CREATED);
        } else {
            return new ResponseEntity<>(HttpStatus.CONFLICT);
        }
    }

    //Retrive single employee
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ResponseEntity<EmployeeResource> get_employee_by_id(@PathVariable("id") int id) {
        Employee employee = dao_employee.get_employee_by_id(id);

        if (employee != null) {
            return new ResponseEntity<>(assembler.to_resource(employee), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    //Update an employee 
    @RequestMapping(value = "/{id}", method = RequestMethod.PUT, consumes = "application/json")
    public ResponseEntity<EmployeeResource> update_employee(@PathVariable("id") int id, @RequestBody EmployeeResource employee_resource) {
        Employee current_employee = dao_employee.get_employee_by_id(id);
        if (employee_resource.getEmployeeAvatar().contains("data:image/")) {
            String avatar_file_name = "/assets/images/avatar/" + write_image_to_context_repository(employee_resource.getEmployeeAvatar());
            current_employee.setEmployeeAvatar(avatar_file_name);
        }
        current_employee.setDepartment(dao_department.get_department_by_id(employee_resource.getDepartmentId()));
        current_employee.setEmployeeName(employee_resource.getEmployeeName());
        current_employee.setEmployeeGender(employee_resource.getEmployeeGender());
        current_employee.setEmployeeDateOfBirth(employee_resource.getEmployeeDateOfBirth());
        current_employee.setEmployeeSalary(employee_resource.getEmployeeSalary());
        current_employee.setEmployeeLevel(employee_resource.getEmployeeLevel());
        current_employee.setEmployeePhoneNumber(employee_resource.getEmployeePhoneNumber());
        current_employee.setEmployeeEmail(employee_resource.getEmployeeEmail());

        boolean is_updated_employee = dao_employee.update_employee(current_employee);
        if (is_updated_employee) {
            return new ResponseEntity<>(assembler.to_resource(current_employee), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    //Delete an employee
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> delete_employee(@PathVariable("id") int id) {
        Employee employee = dao_employee.get_employee_by_id(id);
        boolean is_deleted_employee = dao_employee.delete_employee(employee);
        if (is_deleted_employee) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    private static String write_image_to_context_repository(String base64_image) {
        String part_separator = ",";
        base64_image = base64_image.split(part_separator)[1];
        byte[] data = Base64.getDecoder().decode(base64_image);
        File temp = null;
        try {
            temp = File.createTempFile("avatar", ".jpg", new File("D:\\IT_Projects\\netbeans_workspace\\corp_management_webapp\\build\\web\\assets\\images\\avatar\\"));
            OutputStream stream = new FileOutputStream(temp);
            stream.write(data);

            return temp.getName();
        } catch (FileNotFoundException ex) {
        } catch (IOException ex) {
        }
        return null;
    }
}
