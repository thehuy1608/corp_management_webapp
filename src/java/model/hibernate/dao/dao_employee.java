/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.hibernate.dao;

import java.util.List;
import model.hibernate.config.HibernateUtil;
import model.hibernate.pojo.Employee;
import org.hibernate.Query;
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
     * Add a new Employee
     *
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

    /**
     * Update an existing Employee
     *
     * @param updated_employee
     * @return
     */
    public static boolean update_employee(Employee updated_employee) {
        Session hibernate_session = HibernateUtil.getSessionFactory().openSession();
        try {
            hibernate_session.beginTransaction();
            hibernate_session.update(updated_employee);
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
     * Delete an existing Employee
     *
     * @param deleted_employee
     * @return
     */
    public static boolean delete_employee(Employee deleted_employee) {
        Session hibernate_session = HibernateUtil.getSessionFactory().openSession();
        try {
            hibernate_session.beginTransaction();
            hibernate_session.delete(deleted_employee);
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
     * Get all employee
     *
     * @param first_result
     * @return
     */
    public static List<Employee> get_employees_list() {
        List<Employee> employees_list;
        Session hibernate_session = HibernateUtil.getSessionFactory().openSession();
        try {
            hibernate_session.beginTransaction();
            String hql = "SELECT employee FROM Employee employee";
            Query query = hibernate_session.createQuery(hql);
            employees_list = query.list();
        } catch (Exception e) {
            hibernate_session.flush();
            hibernate_session.close();
            return null;
        }
        hibernate_session.flush();
        hibernate_session.close();

        return employees_list;
    }

    /**
     * Get 5 employees per call, start from the first result
     *
     * @param first_result
     * @return
     */
    public static List<Employee> get_employees_list(int first_result) {
        List<Employee> employees_list;
        Session hibernate_session = HibernateUtil.getSessionFactory().openSession();
        try {
            hibernate_session.beginTransaction();
            String hql = "SELECT employee FROM Employee employee";
            Query query = hibernate_session.createQuery(hql);
            query.setMaxResults(5);
            query.setFirstResult(first_result);
            employees_list = query.list();
        } catch (Exception e) {
            hibernate_session.flush();
            hibernate_session.close();
            return null;
        }
        hibernate_session.flush();
        hibernate_session.close();

        return employees_list;
    }

    /**
     * Get 5 employees match the employee_name per call, start from the first
     * result
     *
     * @param employee_name
     * @param first_result
     * @return
     */
    public static List<Employee> get_employees_list(String employee_name, int first_result) {
        List<Employee> employees_list;
        Session hibernate_session = HibernateUtil.getSessionFactory().openSession();
        try {
            hibernate_session.beginTransaction();
            String hql = "SELECT employee FROM Employee employee WHERE employee.employeeName LIKE :employee_name";
            Query query = hibernate_session.createQuery(hql);
            query.setMaxResults(5);
            query.setFirstResult(first_result);
            query.setParameter("employee_name", "%" + employee_name + "%");
            employees_list = query.list();
        } catch (Exception e) {
            hibernate_session.flush();
            hibernate_session.close();
            return null;
        }
        hibernate_session.flush();
        hibernate_session.close();

        return employees_list;
    }
}
