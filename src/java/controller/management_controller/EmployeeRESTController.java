/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.management_controller;

import java.util.Collection;
import java.util.List;
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
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author WIN 10
 */
@RestController
@ExposesResourceFor(Employee.class)
@RequestMapping(value = "/employee", produces = "application/json")
public class EmployeeRESTController {

    @Autowired
    private EmployeeResourceAssembler assembler;

    //Retrieve all employees
    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<Collection<EmployeeResource>> get_all_employees() {
        List<Employee> employees_list = dao_employee.get_employees_list();
        return new ResponseEntity<>(assembler.to_resource_collection(employees_list), HttpStatus.OK);
    }

    //Create an employee
    @RequestMapping(method = RequestMethod.POST, consumes = "application/json")
    public ResponseEntity<EmployeeResource> create_employee(@RequestBody EmployeeResource employee_resource) {
        Department department = dao_department.get_department_by_id(employee_resource.getDepartmentId());
        Branch branch = dao_branch.get_branch_by_id(employee_resource.getBranchId());
        Employee employee = new Employee(
                branch,
                department,
                employee_resource.getEmployeeName(),
                employee_resource.getEmployeeGender(),
                employee_resource.getEmployeeAvatar(),
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
    public ResponseEntity<EmployeeResource> update_employee(@PathVariable("id") int id, @RequestBody Employee employee) {
        Employee current_employee = dao_employee.get_employee_by_id(id);
        current_employee.setDepartment(employee.getDepartment());
        current_employee.setEmployeeName(employee.getEmployeeName());
        current_employee.setEmployeeGender(employee.getEmployeeGender());
        current_employee.setEmployeeAvatar(employee.getEmployeeAvatar());
        current_employee.setEmployeeDateOfBirth(employee.getEmployeeDateOfBirth());
        current_employee.setEmployeeSalary(employee.getEmployeeSalary());
        current_employee.setEmployeeLevel(employee.getEmployeeLevel());
        current_employee.setEmployeePhoneNumber(employee.getEmployeePhoneNumber());
        current_employee.setEmployeeEmail(employee.getEmployeeEmail());

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

}
