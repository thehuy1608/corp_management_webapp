/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.management_controller;

import model.hibernate.dao.dao_province;
import model.hibernate.pojo.Province;
import model.resource.branch.BranchResource;
import model.resource.branch.BranchResourceAssembler;
import model.resource.province.ProvinceResource;
import model.resource.province.ProvinceResourceAssembler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.ExposesResourceFor;
import org.springframework.hateoas.Resources;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author WIN 10
 */
@RestController
@ExposesResourceFor(ProvinceResource.class)
@RequestMapping(value = "/province", produces = "application/json")
public class ProvinceRESTController {

//    private final ProvinceResourceAssembler province_assembler;
//    private final BranchResourceAssembler branch_assembler;
//    
//    @Autowired
//    public ProvinceRESTController(ProvinceResourceAssembler province_assembler, BranchResourceAssembler branch_assembler) {
//        this.province_assembler = province_assembler;
//        this.branch_assembler = branch_assembler;
//    }
//    
//    //Retrive single province
//    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
//    public ResponseEntity<ProvinceResource> get_all_provinces(@PathVariable("id") int province_id) {
//        Province province = dao_province.get_province_by_id(province_id);
//        if (province != null) {
//            return new ResponseEntity<>(province_assembler.toResource(province), HttpStatus.OK);
//        } else {
//            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
//        }
//    }
//    
//    //Retrieve all branches in province
//    @RequestMapping(value = "/{id}/branches", method = RequestMethod.GET) 
//    public ResponseEntity<Resources<BranchResource>> list_all_branches_in_province(@PathVariable("id") int province_id) {
//        Province province = dao_province.get_province_by_id(province_id);
//        Resources<BranchResource> wrapped = branch_assembler.toEmbeddedList(province.getBranches());
//        return new ResponseEntity<>(wrapped, HttpStatus.OK);
//    }
}
