/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.jsonview;

/**
 *
 * @author WIN 10
 */
public class SimpleDepartment {
    private final int departmentId;
    private final String departmentName;

    public SimpleDepartment(int departmentId, String departmentName) {
        this.departmentId = departmentId;
        this.departmentName = departmentName;
    }

    public int getDepartmentId() {
        return departmentId;
    }

    public String getDepartmentName() {
        return departmentName;
    }
    
    
}
