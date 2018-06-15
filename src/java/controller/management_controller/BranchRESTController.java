/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.management_controller;

import model.hibernate.dao.dao_branch;
import model.hibernate.pojo.Branch;
import model.resource.branch.BranchResource;
import model.resource.branch.BranchResourceAssembler;
import model.resource.province.ProvinceResourceAssembler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.ExposesResourceFor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author WIN 10
 */
@RestController
@ExposesResourceFor(BranchResource.class)
@RequestMapping(value = "/branch", produces = "application/json")
public class BranchRESTController {

//    private final BranchResourceAssembler branch_assembler;
//    private final ProvinceResourceAssembler province_assembler;
//
//    @Autowired
//    public BranchRESTController(BranchResourceAssembler branch_assembler, ProvinceResourceAssembler province_assembler) {
//        this.branch_assembler = branch_assembler;
//        this.province_assembler = province_assembler;
//    }
//
//    //Create a branch
//    @RequestMapping(method = RequestMethod.POST, consumes = "application/json")
//    public ResponseEntity<BranchResource> create_branch(@RequestBody Branch branch) {
//        boolean is_created_branch = dao_branch.add_branch(branch);
//        if (is_created_branch) {
//            return new ResponseEntity<>(branch_assembler.toResource(branch), HttpStatus.CREATED);
//        } else {
//            return new ResponseEntity<>(HttpStatus.CONFLICT);
//        }
//    }
//
//    //Retrieve single branch 
//    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
//    public ResponseEntity<BranchResource> get_department_by_id(@PathVariable("id") int id) {
//        Branch branch = dao_branch.get_branch_by_id(id);
//
//        if (branch != null) {
//            return new ResponseEntity<>(branch_assembler.toResource(branch), HttpStatus.OK);
//        } else {
//            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
//        }
//    }
}
