/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.resource.department;

import model.hibernate.pojo.Department;
import model.resource.ResourceAssembler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.EntityLinks;
import org.springframework.hateoas.Link;
import org.springframework.stereotype.Component;

/**
 *
 * @author WIN 10
 */
@Component
public class DepartmentResourceAssembler extends ResourceAssembler<Department, DepartmentResource>{
    @Autowired
    public EntityLinks entity_links;
    
    private static final String UPDATE_REL = "update";
    private static final String DELETE_REL = "delete";
    
    @Override
    public DepartmentResource to_resource(Department department) {
        DepartmentResource resource = new DepartmentResource(department);
        
        final Link self_link = entity_links.linkToSingleResource(department);
        
        resource.add(self_link.withSelfRel());
        resource.add(self_link.withRel(UPDATE_REL));
        resource.add(self_link.withRel(DELETE_REL));
        
        return resource;
    }
    
}
