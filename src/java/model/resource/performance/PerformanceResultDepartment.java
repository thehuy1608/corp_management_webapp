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
public class PerformanceResultDepartment {

    private final String departmentName;
    private final int totalEmployees;
    private final int totalDownvotes;
    private final int totalUpvotes;
    private final int result;

    public PerformanceResultDepartment(String departmentName, int totalEmployees, int totalDownvotes, int totalUpvotes, int result) {
        this.departmentName = departmentName;
        this.totalEmployees = totalEmployees;
        this.totalDownvotes = totalDownvotes;
        this.totalUpvotes = totalUpvotes;
        this.result = result;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public int getTotalEmployees() {
        return totalEmployees;
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
