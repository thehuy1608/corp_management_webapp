/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.resource.employee;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;
import java.util.Date;
import model.hibernate.pojo.Employee;
import org.springframework.hateoas.ResourceSupport;

/**
 *
 * @author WIN 10
 */
public class EmployeeResource extends ResourceSupport {

    private Integer employeeId;
    private final Integer branchId;
    private final Integer departmentId;
    private final String employeeName;
    private final String employeeGender;
    private final String employeeAvatar;
    private final Date employeeDateOfBirth;
    private final float employeeSalary;
    private final int employeeLevel;
    private final String employeePhoneNumber;
    private final String employeeEmail;
    private final String employeeDescription;
    private final Date modifiedDate;

    public EmployeeResource(Employee employee) {
        this.employeeId = employee.getEmployeeId();
        this.branchId = employee.getBranch().getBranchId();
        this.departmentId = employee.getDepartment().getDepartmentId();
        this.employeeName = employee.getEmployeeName();
        this.employeeGender = employee.getEmployeeGender();
        this.employeeAvatar = employee.getEmployeeAvatar();
        this.employeeDateOfBirth = employee.getEmployeeDateOfBirth();
        this.employeeSalary = employee.getEmployeeSalary();
        this.employeeLevel = employee.getEmployeeLevel();
        this.employeePhoneNumber = employee.getEmployeePhoneNumber();
        this.employeeEmail = employee.getEmployeeEmail();
        this.employeeDescription = employee.getEmployeeDescription();
        this.modifiedDate = employee.getModifiedDate();
    }

    @JsonCreator
    public EmployeeResource(
            @JsonProperty("branchId") Integer branchId,
            @JsonProperty("departmentId") Integer departmentId,
            @JsonProperty("employeeName") String employeeName,
            @JsonProperty("employeeGender") String employeeGender,
            @JsonProperty("employeeAvatar") String employeeAvatar,
            @JsonProperty("employeeDateOfBirth") Date employeeDateOfBirth,
            @JsonProperty("employeeSalary") float employeeSalary,
            @JsonProperty("employeeLevel") int employeeLevel,
            @JsonProperty("employeePhoneNumber") String employeePhoneNumber,
            @JsonProperty("employeeEmail") String employeeEmail,
            @JsonProperty("employeeDescription") String employeeDescription,
            @JsonProperty("modifiedDate") Date modifiedDate
    ) {
        this.branchId = branchId;
        this.departmentId = departmentId;
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

    @JsonProperty("id")
    public Integer getEmployeeId() {
        return employeeId;
    }

    public Integer getBranchId() {
        return branchId;
    }

    public Integer getDepartmentId() {
        return departmentId;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public String getEmployeeGender() {
        return employeeGender;
    }

    public String getEmployeeAvatar() {
        return employeeAvatar;
    }

    public Date getEmployeeDateOfBirth() {
        return employeeDateOfBirth;
    }

    public float getEmployeeSalary() {
        return employeeSalary;
    }

    public int getEmployeeLevel() {
        return employeeLevel;
    }

    public String getEmployeePhoneNumber() {
        return employeePhoneNumber;
    }

    public String getEmployeeEmail() {
        return employeeEmail;
    }

    public String getEmployeeDescription() {
        return employeeDescription;
    }

    public Date getModifiedDate() {
        return modifiedDate;
    }

}
