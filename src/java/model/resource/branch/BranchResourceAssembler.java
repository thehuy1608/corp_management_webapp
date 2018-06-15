/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.resource.branch;

import model.hibernate.pojo.Branch;
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
public class BranchResourceAssembler extends ResourceAssembler<Branch, BranchResource> {

    @Autowired
    public EntityLinks entity_links;

    @Override
    public BranchResource to_resource(Branch branch) {
        BranchResource resource = new BranchResource(branch);

        final Link self_link = entity_links.linkToSingleResource(branch);
        resource.add(self_link.withSelfRel());

        return resource;
    }
}
