/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.resource.branch;

import com.fasterxml.jackson.annotation.JsonProperty;
import model.hibernate.pojo.Branch;
import model.hibernate.pojo.Province;
import org.springframework.hateoas.ResourceSupport;

/**
 *
 * @author WIN 10
 */
public class BranchResource extends ResourceSupport {
    private final Integer branchId;
    private final int provinceId;
    private final String branchName;
    private final String branchAddress;
    private final String branchHotLine;
    private final String branchEmail;

    public BranchResource(Branch branch) {
        this.branchId = branch.getBranchId();
        this.provinceId = branch.getProvince().getProvinceId();
        this.branchName = branch.getBranchName();
        this.branchAddress = branch.getBranchAddress();
        this.branchHotLine = branch.getBranchHotLine();
        this.branchEmail = branch.getBranchEmail();
    }

    @JsonProperty("id")
    public Integer getBranchId() {
        return branchId;
    }

    public Province getProvince() {
        return provinceId;
    }

    public String getBranchName() {
        return branchName;
    }

    public String getBranchAddress() {
        return branchAddress;
    }

    public String getBranchHotLine() {
        return branchHotLine;
    }

    public String getBranchEmail() {
        return branchEmail;
    }
    
    
}
