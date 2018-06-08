/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.management_controller;

import model.hibernate.dao.dao_department;
import model.hibernate.pojo.Department;
import model.jsonview.SimpleDepartment;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author WIN 10
 */
@RestController
@RequestMapping("/department/")
public class DepartmentRESTController {

    @RequestMapping(value = "get_department")
    public SimpleDepartment get_department(@RequestParam("department_id") int department_id) {
        Department current_department = dao_department.get_department_by_id(department_id);
        SimpleDepartment simple_department = new SimpleDepartment(current_department.getDepartmentId(), current_department.getDepartmentName());
        return simple_department;
    }
    
    @RequestMapping(value = "edit_department")
    public SimpleDepartment edit_department(@RequestParam("edit_department_id") int edit_department_id, @RequestParam("edit_department_name") String edit_department_name) {
        Department department = dao_department.get_department_by_id(edit_department_id);
        department.setDepartmentName(edit_department_name);
        dao_department.update_department(department);
        SimpleDepartment simple_department = new SimpleDepartment(department.getDepartmentId(), department.getDepartmentName());
        return simple_department;
    }
}
