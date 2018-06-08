/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.management_controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import model.hibernate.dao.dao_department;
import model.hibernate.pojo.Department;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author WIN 10
 */
@Controller
@RequestMapping("/department/")
public class DepartmentController {

    @RequestMapping(value = "search")
    public String search_department(ModelMap model,
            HttpServletRequest request) {
        //Format String, remove spaces at begin and the end of department name
        String department_name = request.getParameter("department_name");
        List<Department> departments_list;
        if (department_name.isEmpty()) {
            //TO-DO when department name is an empty String: return all departments exist.
            departments_list = dao_department.get_departments_list();
        } else {
            //TO-DO when department name is not empty: Find department which has corresponding name
            departments_list = dao_department.get_departments_list(department_name);
        }
        model.addAttribute("departments_list", departments_list);
        return "management/department";
    }
}
