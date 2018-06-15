/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.management_controller;

import java.util.Collection;
import java.util.List;
import model.hibernate.dao.dao_department;
import model.hibernate.pojo.Department;
import model.resource.department.DepartmentResource;
import model.resource.department.DepartmentResourceAssembler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.ExposesResourceFor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.ModelMap;
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
@ExposesResourceFor(Department.class)
@RequestMapping(value = "/department", produces = "application/json")
public class DepartmentRESTController {

    @Autowired
    private DepartmentResourceAssembler assembler;

    //Retrieve all departments
    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<Collection<DepartmentResource>> get_all_departments() {
        List<Department> departments = dao_department.get_departments_list();
        return new ResponseEntity<>(assembler.to_resource_collection(departments), HttpStatus.OK);
    }
    

    //Create a department
    @RequestMapping(method = RequestMethod.POST, consumes = "application/json")
    public ResponseEntity<DepartmentResource> create_department(@RequestBody Department department) {
        boolean is_created_department = dao_department.add_department(department);
        if (is_created_department) {
            return new ResponseEntity<>(assembler.to_resource(department), HttpStatus.CREATED);
        } else {
            return new ResponseEntity<>(HttpStatus.CONFLICT);
        }
    }
    
    //Find a department by its name
    @RequestMapping(params = "search_department_name", method = RequestMethod.GET)
    public ModelAndView get_department_by_name(@RequestParam("search_department_name") String department_name, ModelMap model) {
        List<Department> departments = dao_department.get_departments_list(department_name);
        List<DepartmentResource> department_resources = (List<DepartmentResource>) assembler.to_resource_collection(departments);
        model.addAttribute("departments_list", department_resources);
        return new ModelAndView("management/department");
    }

    //Retrieve single department
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ResponseEntity<DepartmentResource> get_department_by_id(@PathVariable("id") int id) {
        Department department = dao_department.get_department_by_id(id);

        if (department != null) {
            return new ResponseEntity<>(assembler.to_resource(department), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
    
    //Update a department
    @RequestMapping(value = "/{id}", method = RequestMethod.PUT, consumes = "application/json")
    public ResponseEntity<DepartmentResource> update_department(@PathVariable("id") int id, @RequestBody Department department) {
        Department current_department = dao_department.get_department_by_id(id);
        current_department.setDepartmentName(department.getDepartmentName());
        boolean is_updated_department = dao_department.update_department(current_department);
        if (is_updated_department) {
            return new ResponseEntity<>(assembler.to_resource(current_department), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
    
    //Delete a department
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> delete_department(@PathVariable("id") int id) {
        Department department = dao_department.get_department_by_id(id);
        boolean is_deleted_department = dao_department.delete_department(department);
        if (is_deleted_department) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}
