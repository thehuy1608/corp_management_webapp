/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.resource.province;

import model.hibernate.pojo.Province;
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
public class ProvinceResourceAssembler extends ResourceAssembler<Province, ProvinceResource> {

    @Autowired
    public EntityLinks entity_links;


    @Override
    public ProvinceResource to_resource(Province province) {
        ProvinceResource resource = new ProvinceResource(province);
        
        final Link self_link = entity_links.linkToSingleResource(province);
        resource.add(self_link.withSelfRel());
        return resource;
    }

}
