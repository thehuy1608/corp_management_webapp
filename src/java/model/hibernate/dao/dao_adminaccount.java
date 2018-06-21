/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.hibernate.dao;

import java.util.List;
import model.hibernate.config.HibernateUtil;
import model.hibernate.pojo.Adminaccount;
import model.hibernate.pojo.Employee;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author WIN 10
 */
public class dao_adminaccount {

    public static int check_login(String loginname, String password) {
        Session hibernate_session = HibernateUtil.getSessionFactory().openSession();
        try {
            int result = 0;
            hibernate_session.beginTransaction();
            String hql = "SELECT adminaccount.administrator.employee.employeeId FROM Adminaccount adminaccount WHERE accountUsername=:loginname AND accountPassword=:password";
            Query query = hibernate_session.createQuery(hql);
            query.setParameter("loginname", loginname);
            query.setParameter("password", password);
            List<Integer> result_set = query.list();
            if (!result_set.isEmpty()) {
                result = result_set.get(0);
            }
            return result;
        } catch (Exception e) {
            hibernate_session.flush();
            hibernate_session.close();
        }
        hibernate_session.flush();
        hibernate_session.close();
        return 0;
    }

    public static boolean update_account(Adminaccount account) {
        Session hibernate_session = HibernateUtil.getSessionFactory().openSession();
        try {
            hibernate_session.beginTransaction();
            hibernate_session.update(account);
            hibernate_session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            if (hibernate_session.getTransaction().isActive()) {
                hibernate_session.getTransaction().rollback();
            }
            hibernate_session.flush();
            hibernate_session.close();
        }
        hibernate_session.flush();
        hibernate_session.close();
        return false;
    }
    
    public static Adminaccount get_account(int account_id) {
        Session hibernate_session = HibernateUtil.getSessionFactory().openSession();
        Adminaccount account = null;
        try {
            hibernate_session.beginTransaction();
            account = (Adminaccount) hibernate_session.get(Adminaccount.class, account_id);
        } catch (Exception e) {
            hibernate_session.flush();
            hibernate_session.close();
        }
        hibernate_session.flush();
        hibernate_session.close();
        return account;
    }

    public static Adminaccount get_account_by_email(String email) {
        Adminaccount account = null;
        Session hibernate_session = HibernateUtil.getSessionFactory().openSession();
        try {
            hibernate_session.beginTransaction();
            String hql = "SELECT account from Adminaccount account WHERE account.administrator.employee.employeeEmail = :email";
            Query query = hibernate_session.createQuery(hql);
            query.setParameter("email", email);
            List<Adminaccount> result = query.list();
            if (!result.isEmpty()) {
                account = result.get(0);
                return account;
            } else {
                return null;
            }

        } catch (Exception e) {
            hibernate_session.flush();
            hibernate_session.close();
        }
        hibernate_session.flush();
        hibernate_session.close();
        return null;
    }
    
    public static Employee get_employee(int account_id) {
        Employee employee = null;
        Session hibernate_session = HibernateUtil.getSessionFactory().openSession();
        try {
            hibernate_session.beginTransaction();
            String hql = "SELECT account.administrator.employee from Adminaccount account WHERE account.fkAdministratorId = :account_id";
            Query query = hibernate_session.createQuery(hql);
            query.setParameter("account_id", account_id);
            List<Employee> result = query.list();
            if (!result.isEmpty()) {
                employee = result.get(0);
                return employee;
            } else {
                return null;
            }

        } catch (Exception e) {
            hibernate_session.flush();
            hibernate_session.close();
        }
        hibernate_session.flush();
        hibernate_session.close();
        return null;
    }
    
    

    public static void main(String[] args) {
        System.out.println(get_account(1).getAdministrator().getEmployee().getEmployeeAvatar());
    }
}
