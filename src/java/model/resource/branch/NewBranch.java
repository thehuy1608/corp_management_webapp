/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.resource.branch;

/**
 *
 * @author WIN 10
 */
public class NewBranch {

    private int provinceId;
    private String branchName;
    private String branchAddress;
    private String branchHotLine;
    private String branchEmail;

    public NewBranch() {

    }

    public NewBranch(int provinceId, String branchName, String branchAddress, String branchHotLine, String branchEmail) {
        this.provinceId = provinceId;
        this.branchName = branchName;
        this.branchAddress = branchAddress;
        this.branchHotLine = branchHotLine;
        this.branchEmail = branchEmail;
    }

    public int getProvinceId() {
        return provinceId;
    }

    public void setProvinceId(int provinceId) {
        this.provinceId = provinceId;
    }

    public String getBranchName() {
        return branchName;
    }

    public void setBranchName(String branchName) {
        this.branchName = branchName;
    }

    public String getBranchAddress() {
        return branchAddress;
    }

    public void setBranchAddress(String branchAddress) {
        this.branchAddress = branchAddress;
    }

    public String getBranchHotLine() {
        return branchHotLine;
    }

    public void setBranchHotLine(String branchHotLine) {
        this.branchHotLine = branchHotLine;
    }

    public String getBranchEmail() {
        return branchEmail;
    }

    public void setBranchEmail(String branchEmail) {
        this.branchEmail = branchEmail;
    }

}
