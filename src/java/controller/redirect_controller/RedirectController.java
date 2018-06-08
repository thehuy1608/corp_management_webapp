/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.redirect_controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author WIN 10
 */
@Controller
public class RedirectController {
    @RequestMapping(value = "/department", method = RequestMethod.GET)
    public String go_to_department() {
        return "management/department";
    }
}
