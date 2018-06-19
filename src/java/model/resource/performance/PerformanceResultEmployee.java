/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.resource.performance;

/**
 *
 * @author WIN 10
 */
public class PerformanceResultEmployee {

    private final int employeeId;
    private final String employeeAvatar;
    private final String employeeName;
    private final String departmentName;
    private final int totalDownvotes;
    private final int totalUpvotes;
    private final int result;

    public PerformanceResultEmployee(int employeeId, String employeeAvatar, String employeeName, String departmentName, int total_downvotes, int total_upvotes, int result) {
        this.employeeId = employeeId;
        this.employeeAvatar = employeeAvatar;
        this.employeeName = employeeName;
        this.departmentName = departmentName;
        this.totalDownvotes = total_downvotes;
        this.totalUpvotes = total_upvotes;
        this.result = result;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public String getEmployeeAvatar() {
        return employeeAvatar;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public int getTotalDownvotes() {
        return totalDownvotes;
    }

    public int getTotalUpvotes() {
        return totalUpvotes;
    }

    public int getResult() {
        return result;
    }

}
