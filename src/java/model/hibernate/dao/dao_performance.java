/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.hibernate.dao;

import java.util.List;
import model.hibernate.config.HibernateUtil;
import model.hibernate.pojo.Performance;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author WIN 10
 */
public class dao_performance {

    private final static int UPVOTE = 1;
    private final static int DOWNVOTE = -1;

    public static boolean add_performance(Performance performance) {
        Session hibernate_session = HibernateUtil.getSessionFactory().openSession();
        try {
            hibernate_session.beginTransaction();
            hibernate_session.save(performance);
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

    public static boolean update_performance(Performance performance) {
        Session hibernate_session = HibernateUtil.getSessionFactory().openSession();
        try {
            hibernate_session.beginTransaction();
            hibernate_session.update(performance);
            return true;
        } catch (Exception e) {
            hibernate_session.flush();
            hibernate_session.close();
        }
        hibernate_session.flush();
        hibernate_session.close();
        return false;
    }

    public static boolean delete_performance(Performance performance) {
        Session hibernate_session = HibernateUtil.getSessionFactory().openSession();
        try {
            hibernate_session.beginTransaction();
            hibernate_session.delete(performance);
            return true;
        } catch (Exception e) {
            hibernate_session.flush();
            hibernate_session.close();
        }
        hibernate_session.flush();
        hibernate_session.close();
        return false;
    }

    public static int get_total_upvote_of_employee(int employee_id) {
        int total_upvote = 0;
        Session hibernate_session = HibernateUtil.getSessionFactory().openSession();
        try {
            hibernate_session.beginTransaction();
            String hql = "SELECT COUNT(*) FROM Performance performance"
                    + " WHERE performance.performanceResult=:performance_result AND"
                    + " performance.employee.employeeId=:employee_id";
            Query query = hibernate_session.createQuery(hql);
            query.setParameter("performance_result", UPVOTE);
            query.setParameter("employee_id", employee_id);
            Long result = (Long) query.uniqueResult();
            total_upvote = result.intValue();
        } catch (Exception e) {
            hibernate_session.flush();
            hibernate_session.close();
        }
        hibernate_session.flush();
        hibernate_session.close();
        return total_upvote;
    }

    public static int get_total_downvote_of_employee(int employee_id) {
        int total_upvote = 0;
        Session hibernate_session = HibernateUtil.getSessionFactory().openSession();
        try {
            hibernate_session.beginTransaction();
            String hql = "SELECT COUNT(*) FROM Performance performance"
                    + " WHERE performance.performanceResult=:performance_result AND"
                    + " performance.employee.employeeId=:employee_id";
            Query query = hibernate_session.createQuery(hql);
            query.setParameter("performance_result", DOWNVOTE);
            query.setParameter("employee_id", employee_id);
            Long result = (Long) query.uniqueResult();
            total_upvote = result.intValue();
        } catch (Exception e) {
            hibernate_session.flush();
            hibernate_session.close();
        }
        hibernate_session.flush();
        hibernate_session.close();
        return total_upvote;
    }

    public static int get_performance_result_of_employee(int employee_id) {
        int performance_result = 0;
        Session hibernate_session = HibernateUtil.getSessionFactory().openSession();
        try {
            hibernate_session.beginTransaction();

            String hql_downvote = "SELECT COUNT(*) FROM Performance performance"
                    + " WHERE performance.performanceResult=:performance_result AND"
                    + " performance.employee.employeeId=:employee_id";
            Query query_downvote = hibernate_session.createQuery(hql_downvote);
            query_downvote.setParameter("performance_result", DOWNVOTE);
            query_downvote.setParameter("employee_id", employee_id);
            Long result_downvote = (Long) query_downvote.uniqueResult();
            int total_downvote = result_downvote.intValue();

            String hql_upvote = "SELECT COUNT(*) FROM Performance performance"
                    + " WHERE performance.performanceResult=:performance_result AND"
                    + " performance.employee.employeeId=:employee_id";
            Query query_upvote = hibernate_session.createQuery(hql_upvote);
            query_upvote.setParameter("performance_result", UPVOTE);
            query_upvote.setParameter("employee_id", employee_id);
            Long result_upvote = (Long) query_upvote.uniqueResult();
            int total_upvote = result_upvote.intValue();

            performance_result = total_downvote * -1 + total_upvote * 1;
        } catch (Exception e) {
            hibernate_session.flush();
            hibernate_session.close();
        }
        hibernate_session.flush();
        hibernate_session.close();
        return performance_result;
    }

    public static int get_total_upvote_of_department(int department_id) {
        int total_upvote = 0;
        Session hibernate_session = HibernateUtil.getSessionFactory().openSession();
        try {
            hibernate_session.beginTransaction();
            String hql = "SELECT COUNT(*) FROM Performance performance"
                    + " WHERE performance.performanceResult=:performance_result AND"
                    + " performance.employee.department.departmentId=:department_id";
            Query query = hibernate_session.createQuery(hql);
            query.setParameter("performance_result", UPVOTE);
            query.setParameter("department_id", department_id);
            Long result = (Long) query.uniqueResult();
            total_upvote = result.intValue();
        } catch (Exception e) {
            hibernate_session.flush();
            hibernate_session.close();
        }
        hibernate_session.flush();
        hibernate_session.close();
        return total_upvote;
    }

    public static int get_total_downvote_of_department(int department_id) {
        int total_downvote = 0;
        Session hibernate_session = HibernateUtil.getSessionFactory().openSession();
        try {
            hibernate_session.beginTransaction();
            String hql = "SELECT COUNT(*) FROM Performance performance"
                    + " WHERE performance.performanceResult=:performance_result AND"
                    + " performance.employee.department.departmentId=:department_id";
            Query query = hibernate_session.createQuery(hql);
            query.setParameter("performance_result", DOWNVOTE);
            query.setParameter("department_id", department_id);
            Long result = (Long) query.uniqueResult();
            total_downvote = result.intValue();
        } catch (Exception e) {
            hibernate_session.flush();
            hibernate_session.close();
        }
        hibernate_session.flush();
        hibernate_session.close();
        return total_downvote;
    }

    public static int get_performance_result_of_department(int department_id) {
        int performance_result = 0;
        Session hibernate_session = HibernateUtil.getSessionFactory().openSession();
        try {
            hibernate_session.beginTransaction();

            String hql_downvote = "SELECT COUNT(*) FROM Performance performance"
                    + " WHERE performance.performanceResult=:performance_result AND"
                    + " performance.employee.department.departmentId=:department_id";
            Query query_downvote = hibernate_session.createQuery(hql_downvote);
            query_downvote.setParameter("performance_result", DOWNVOTE);
            query_downvote.setParameter("department_id", department_id);
            Long result_downvote = (Long) query_downvote.uniqueResult();
            int total_downvote = result_downvote.intValue();

            String hql_upvote = "SELECT COUNT(*) FROM Performance performance"
                    + " WHERE performance.performanceResult=:performance_result AND"
                    + " performance.employee.department.departmentId=:department_id";
            Query query_upvote = hibernate_session.createQuery(hql_upvote);
            query_upvote.setParameter("performance_result", UPVOTE);
            query_upvote.setParameter("department_id", department_id);
            Long result_upvote = (Long) query_upvote.uniqueResult();
            int total_upvote = result_upvote.intValue();

            performance_result = total_downvote * -1 + total_upvote * 1;
        } catch (Exception e) {
            hibernate_session.flush();
            hibernate_session.close();
        }
        hibernate_session.flush();
        hibernate_session.close();
        return performance_result;
    }
       
    public static List<Performance> get_top_10_performances() {
        List<Performance> top_10_performances = null;
        Session hibernate_session = HibernateUtil.getSessionFactory().openSession();
        try {
            hibernate_session.beginTransaction();
            String hql = "SELECT performance FROM Performance DESC";
            Query query = hibernate_session.createQuery(hql);
            query.setFirstResult(0);
            query.setMaxResults(10);
            top_10_performances = query.list();
            return top_10_performances;
        } catch (Exception e) {
            hibernate_session.flush();
        hibernate_session.close();
        }
        hibernate_session.flush();
        hibernate_session.close();
        return top_10_performances;
    }

    public static void main(String[] args) {
        List<Performance> performances = get_top_10_performances();
        performances.forEach(performance -> {
            System.out.println(performance.getPerformanceId());
        });
    }
}
