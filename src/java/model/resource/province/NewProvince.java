/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.resource.province;

/**
 *
 * @author WIN 10
 */
public class NewProvince {

    private String provinceName;
    private String provincePostalCode;

    public NewProvince() {

    }

    public NewProvince(String provinceName, String provincePostalCode) {
        this.provinceName = provinceName;
        this.provincePostalCode = provincePostalCode;
    }

    public String getProvinceName() {
        return provinceName;
    }

    public void setProvinceName(String provinceName) {
        this.provinceName = provinceName;
    }

    public String getProvincePostalCode() {
        return provincePostalCode;
    }

    public void setProvincePostalCode(String provincePostalCode) {
        this.provincePostalCode = provincePostalCode;
    }

}
