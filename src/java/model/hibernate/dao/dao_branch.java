/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.hibernate.dao;

import model.hibernate.config.HibernateUtil;
import model.hibernate.pojo.Branch;
import org.hibernate.Session;

/**
 *
 * @author WIN 10
 */
public class dao_branch {

    /**
     *Get a Branch object by its ID, return null if no branch found
     * @param branch_id
     * @return
     */
    public static Branch get_branch_by_id(int branch_id) {
        Branch branch = null;
        Session hibernate_session = HibernateUtil.getSessionFactory().openSession();
        try {
            hibernate_session.beginTransaction();
            branch = (Branch) hibernate_session.get(Branch.class, branch_id);
        } catch (Exception e) {
            hibernate_session.flush();
            hibernate_session.close();
        }
        hibernate_session.flush();
        hibernate_session.close();
        return branch;
    }
    
    public static boolean add_branch(Branch new_branch) {
        Session hibernate_session = HibernateUtil.getSessionFactory().openSession();
        try {
            hibernate_session.beginTransaction();
            hibernate_session.save(new_branch);
            hibernate_session.getTransaction().commit();
        } catch (Exception e) {
            if (hibernate_session.getTransaction().isActive()) {
                hibernate_session.getTransaction().rollback();
            }
            hibernate_session.flush();
            hibernate_session.close();
            return false;
        }
        hibernate_session.flush();
        hibernate_session.close();
        return true;
    }
}
