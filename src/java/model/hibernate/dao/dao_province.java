/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.hibernate.dao;

import model.hibernate.config.HibernateUtil;
import model.hibernate.pojo.Province;
import org.hibernate.Session;

/**
 *
 * @author WIN 10
 */
public class dao_province {

    /**
     * Get a Branch object by its ID, return null if no branch found
     *
     * @param province_id
     * @return
     */
    public static Province get_province_by_id(int province_id) {
        Province province = null;
        Session hibernate_session = HibernateUtil.getSessionFactory().openSession();
        try {
            hibernate_session.beginTransaction();
            province = (Province) hibernate_session.get(Province.class, province_id);
        } catch (Exception e) {
            hibernate_session.flush();
            hibernate_session.close();
        }
        hibernate_session.flush();
        hibernate_session.close();
        return province;
    }
}
