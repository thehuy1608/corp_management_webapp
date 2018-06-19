/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.resource.performance;

import model.hibernate.pojo.Performance;
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
public class PerformanceRateResourceAssembler extends ResourceAssembler<Performance, PerformanceRateResource> {

    @Autowired
    public EntityLinks entity_links;

    @Override
    public PerformanceRateResource to_resource(Performance performance) {
        PerformanceRateResource resource = new PerformanceRateResource(performance);

        final Link self_link = entity_links.linkToSingleResource(performance);

        resource.add(self_link.withSelfRel());
        return resource;
    }

}
