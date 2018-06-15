/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.resource;

import java.util.Collection;
import java.util.stream.Collectors;

/**
 *
 * @author WIN 10
 * @param <DomainType>
 * @param <ResourceType>
 */
public abstract class ResourceAssembler<DomainType, ResourceType> {
    public abstract ResourceType to_resource(DomainType domain_object);
    
    public Collection<ResourceType> to_resource_collection(Collection<DomainType> domain_objects) {
        return domain_objects.stream().map(o -> to_resource(o)).collect(Collectors.toList());
    }
}
