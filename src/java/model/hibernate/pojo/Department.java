package model.hibernate.pojo;
// Generated Jun 1, 2018 5:38:26 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;
import model.interfaces.Identifiable;

/**
 * Department generated by hbm2java
 */
public class Department  implements java.io.Serializable, Identifiable {


     private Integer departmentId;
     private String departmentName;
     private Set<Employee> employees = new HashSet<Employee>(0);

    public Department() {
    }

	
    public Department(String departmentName) {
        this.departmentName = departmentName;
    }
    public Department(String departmentName, Set<Employee> employees) {
       this.departmentName = departmentName;
       this.employees = employees;
    }
   
    public Integer getDepartmentId() {
        return this.departmentId;
    }
    
    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
    }
    public String getDepartmentName() {
        return this.departmentName;
    }
    
    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }
    public Set<Employee> getEmployees() {
        return this.employees;
    }
    
    public void setEmployees(Set<Employee> employees) {
        this.employees = employees;
    }

    @Override
    public void setId(int id) {
        this.departmentId = id;
    }

    @Override
    public Integer getId() {
        return this.departmentId;
    }




}


