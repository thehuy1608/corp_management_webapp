/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.hibernate.dao;

import model.hibernate.config.HibernateUtil;
import model.hibernate.pojo.Employee;
import org.hibernate.Session;

/**
 *
 * @author WIN 10
 */
public class dao_employee {

    /**
     * Get an Employee object by its ID, return null if no employee found
     *
     * @param employee_id
     * @return
     */
    public static Employee get_employee_by_id(int employee_id) {
        Employee employee = null;
        Session hibernate_session = HibernateUtil.getSessionFactory().openSession();
        try {
            hibernate_session.beginTransaction();
            employee = (Employee) hibernate_session.get(Employee.class, employee_id);
        } catch (Exception e) {
            hibernate_session.flush();
            hibernate_session.close();
        }
        hibernate_session.flush();
        hibernate_session.close();
        return employee;
    }

    /**
     *Add a new Employee
     * @param new_employee
     * @return
     */
    public static boolean add_employee(Employee new_employee) {
        Session hibernate_session = HibernateUtil.getSessionFactory().openSession();
        try {
            hibernate_session.beginTransaction();
            hibernate_session.save(new_employee);
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
