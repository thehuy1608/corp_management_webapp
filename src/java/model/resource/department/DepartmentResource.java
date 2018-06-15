/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.resource.department;

import com.fasterxml.jackson.annotation.JsonProperty;
import model.hibernate.pojo.Department;
import org.springframework.hateoas.ResourceSupport;

/**
 *
 * @author WIN 10
 */
public class DepartmentResource extends ResourceSupport{
    private final int departmentId;
    private final String departmentName;

    public DepartmentResource(Department department) {
        this.departmentId = department.getDepartmentId();
        this.departmentName = department.getDepartmentName();
    }

    @JsonProperty("id")
    public int getDepartmentId() {
        return departmentId;
    }

    public String getDepartmentName() {
        return departmentName;
    }
    
    
}
