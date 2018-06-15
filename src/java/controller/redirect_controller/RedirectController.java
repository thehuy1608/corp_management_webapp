/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.redirect_controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author WIN 10
 */
@Controller
@RequestMapping("/management")
public class RedirectController {

    @RequestMapping("/department")
    public String show_department() {
        return "management/department";
    }

    @RequestMapping("/employee")
    public String show_employee() {
        return "management/employee";
    }
}
