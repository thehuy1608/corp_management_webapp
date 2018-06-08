/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.hibernate.dao;

import java.util.List;
import model.hibernate.config.HibernateUtil;
import model.hibernate.pojo.Department;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author WIN 10
 */
public class dao_department {

    /**
     * Get a list of all departments
     *
     * @return
     */
    public static List<Department> get_departments_list() {
        List<Department> departments_list = null;
        Session hibernate_session = HibernateUtil.getSessionFactory().openSession();
        try {
            hibernate_session.beginTransaction();
            String hql = "SELECT department FROM Department department";
            Query query = hibernate_session.createQuery(hql);
            departments_list = query.list();
        } catch (Exception e) {
            hibernate_session.flush();
            hibernate_session.close();
        }
        hibernate_session.flush();
        hibernate_session.close();
        return departments_list;
    }

    /**
     * Get a list of all departments have name like the department name input
     *
     * @param department_name
     * @return
     */
    public static List<Department> get_departments_list(String department_name) {
        List<Department> departments_list = null;
        Session hibernate_session = HibernateUtil.getSessionFactory().openSession();
        try {
            hibernate_session.beginTransaction();
            String hql = "SELECT department FROM Department department WHERE department.departmentName LIKE :department_name";
            Query query = hibernate_session.createQuery(hql);
            query.setParameter("department_name", department_name);
            departments_list = query.list();
        } catch (Exception e) {
            hibernate_session.flush();
            hibernate_session.close();
        }
        hibernate_session.flush();
        hibernate_session.close();
        return departments_list;
    }

    /**
     * Get a Department object by its ID, return null if no department found
     *
     * @param department_id
     * @return
     */
    public static Department get_department_by_id(int department_id) {
        Department department = null;
        Session hibernate_session = HibernateUtil.getSessionFactory().openSession();
        try {
            hibernate_session.beginTransaction();
            department = (Department) hibernate_session.get(Department.class, department_id);
        } catch (Exception e) {
            hibernate_session.flush();
            hibernate_session.close();
        }
        hibernate_session.flush();
        hibernate_session.close();
        return department;
    }

    /**
     * Get a Department object by its name, return null if no department found
     *
     * @param deparment_name
     * @return
     */
    public static Department get_department_by_name(String deparment_name) {
        Department department = null;
        Session hibernate_session = HibernateUtil.getSessionFactory().openSession();
        try {
            hibernate_session.beginTransaction();
            String hql = "SELECT department FROM Department department WHERE department.departmentName=:department_name";
            Query query = hibernate_session.createQuery(hql);
            query.setParameter("department_name", deparment_name);
            List<Department> result = query.list();
            if (result.size() > 0) {
                department = result.get(0);
            }
        } catch (Exception e) {
            hibernate_session.flush();
            hibernate_session.close();
        }
        hibernate_session.flush();
        hibernate_session.close();
        return department;
    }

    /**
     * Add a new Department object
     *
     * @param new_department
     * @return
     */
    public static boolean add_department(Department new_department) {
        Session hibernate_session = HibernateUtil.getSessionFactory().openSession();
        try {
            hibernate_session.beginTransaction();
            hibernate_session.save(new_department);
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

    /**
     * Update a Department object
     *
     * @param modified_department
     * @return
     */
    public static boolean update_department(Department modified_department) {
        Session hibernate_session = HibernateUtil.getSessionFactory().openSession();
        try {
            hibernate_session.beginTransaction();
            hibernate_session.update(modified_department);
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

    /**
     * Delete a Department
     *
     * @param deleted_department
     * @return
     */
    public static boolean delete_department(Department deleted_department) {
        Session hibernate_session = HibernateUtil.getSessionFactory().openSession();
        try {
            hibernate_session.beginTransaction();
            hibernate_session.delete(deleted_department);
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
