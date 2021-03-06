package model.hibernate.pojo;
// Generated Jun 1, 2018 5:38:26 PM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import model.interfaces.Identifiable;

/**
 * Employee generated by hbm2java
 */
public class Employee  implements java.io.Serializable, Identifiable {


     private Integer employeeId;
     private Branch branch;
     private Department department;
     private String employeeName;
     private String employeeGender;
     private String employeeAvatar;
     private Date employeeDateOfBirth;
     private float employeeSalary;
     private int employeeLevel;
     private String employeePhoneNumber;
     private String employeeEmail;
     private String employeeDescription;
     private Date modifiedDate;
     private Set<Performance> performances = new HashSet<Performance>(0);
     private Set<Administrator> administrators = new HashSet<Administrator>(0);

    public Employee() {
    }

	
    public Employee(Branch branch, Department department, String employeeName, String employeeGender, String employeeAvatar, Date employeeDateOfBirth, float employeeSalary, int employeeLevel, String employeePhoneNumber, String employeeEmail, String employeeDescription, Date modifiedDate) {
        this.branch = branch;
        this.department = department;
        this.employeeName = employeeName;
        this.employeeGender = employeeGender;
        this.employeeAvatar = employeeAvatar;
        this.employeeDateOfBirth = employeeDateOfBirth;
        this.employeeSalary = employeeSalary;
        this.employeeLevel = employeeLevel;
        this.employeePhoneNumber = employeePhoneNumber;
        this.employeeEmail = employeeEmail;
        this.employeeDescription = employeeDescription;
        this.modifiedDate = modifiedDate;
    }
    
    public Employee(Branch branch, Department department, String employeeName, String employeeGender, String employeeAvatar, Date employeeDateOfBirth, float employeeSalary, int employeeLevel, String employeePhoneNumber, String employeeEmail, String employeeDescription, Date modifiedDate, Set<Performance> performances, Set<Administrator> administrators) {
       this.branch = branch;
       this.department = department;
       this.employeeName = employeeName;
       this.employeeGender = employeeGender;
       this.employeeAvatar = employeeAvatar;
       this.employeeDateOfBirth = employeeDateOfBirth;
       this.employeeSalary = employeeSalary;
       this.employeeLevel = employeeLevel;
       this.employeePhoneNumber = employeePhoneNumber;
       this.employeeEmail = employeeEmail;
       this.employeeDescription = employeeDescription;
       this.modifiedDate = modifiedDate;
       this.performances = performances;
       this.administrators = administrators;
    }
   
    public Integer getEmployeeId() {
        return this.employeeId;
    }
    
    public void setEmployeeId(Integer employeeId) {
        this.employeeId = employeeId;
    }
    public Branch getBranch() {
        return this.branch;
    }
    
    public void setBranch(Branch branch) {
        this.branch = branch;
    }
    public Department getDepartment() {
        return this.department;
    }
    
    public void setDepartment(Department department) {
        this.department = department;
    }
    public String getEmployeeName() {
        return this.employeeName;
    }
    
    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }
    public String getEmployeeGender() {
        return this.employeeGender;
    }
    
    public void setEmployeeGender(String employeeGender) {
        this.employeeGender = employeeGender;
    }
    public String getEmployeeAvatar() {
        return this.employeeAvatar;
    }
    
    public void setEmployeeAvatar(String employeeAvatar) {
        this.employeeAvatar = employeeAvatar;
    }
    public Date getEmployeeDateOfBirth() {
        return this.employeeDateOfBirth;
    }
    
    public void setEmployeeDateOfBirth(Date employeeDateOfBirth) {
        this.employeeDateOfBirth = employeeDateOfBirth;
    }
    public float getEmployeeSalary() {
        return this.employeeSalary;
    }
    
    public void setEmployeeSalary(float employeeSalary) {
        this.employeeSalary = employeeSalary;
    }
    public int getEmployeeLevel() {
        return this.employeeLevel;
    }
    
    public void setEmployeeLevel(int employeeLevel) {
        this.employeeLevel = employeeLevel;
    }
    public String getEmployeePhoneNumber() {
        return this.employeePhoneNumber;
    }
    
    public void setEmployeePhoneNumber(String employeePhoneNumber) {
        this.employeePhoneNumber = employeePhoneNumber;
    }
    public String getEmployeeEmail() {
        return this.employeeEmail;
    }
    
    public void setEmployeeEmail(String employeeEmail) {
        this.employeeEmail = employeeEmail;
    }
    public String getEmployeeDescription() {
        return this.employeeDescription;
    }
    
    public void setEmployeeDescription(String employeeDescription) {
        this.employeeDescription = employeeDescription;
    }
    public Date getModifiedDate() {
        return this.modifiedDate;
    }
    
    public void setModifiedDate(Date modifiedDate) {
        this.modifiedDate = modifiedDate;
    }
    public Set<Performance> getPerformances() {
        return this.performances;
    }
    
    public void setPerformances(Set<Performance> performances) {
        this.performances = performances;
    }
    public Set<Administrator> getAdministrators() {
        return this.administrators;
    }
    
    public void setAdministrators(Set<Administrator> administrators) {
        this.administrators = administrators;
    }

    @Override
    public void setId(int id) {
        this.employeeId = id;
    }

    @Override
    public Integer getId() {
        return this.employeeId;
    }




}


