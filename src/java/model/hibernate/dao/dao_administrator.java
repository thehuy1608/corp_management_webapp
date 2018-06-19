/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.hibernate.dao;

import model.hibernate.config.HibernateUtil;
import model.hibernate.pojo.Administrator;
import org.hibernate.Session;

/**
 *
 * @author WIN 10
 */
public class dao_administrator {
    public static Administrator get_administrator_by_id(int administrator_id) {
        Administrator administrator = null;
        Session hibernate_session = HibernateUtil.getSessionFactory().openSession();
        try {
            hibernate_session.beginTransaction();
            administrator = (Administrator) hibernate_session.get(Administrator.class, administrator_id);
        } catch (Exception e) {
            hibernate_session.flush();
            hibernate_session.close();
        }
        hibernate_session.flush();
        hibernate_session.close();
        return administrator;
    }
}
