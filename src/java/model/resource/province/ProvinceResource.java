/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.resource.province;

import com.fasterxml.jackson.annotation.JsonProperty;
import model.hibernate.pojo.Province;
import org.springframework.hateoas.ResourceSupport;

/**
 *
 * @author WIN 10
 */
public class ProvinceResource extends ResourceSupport {

    private final Integer provinceId;
    private final String provinceName;
    private final String provincePostalCode;

    public ProvinceResource(Province province) {
        this.provinceId = province.getProvinceId();
        this.provinceName = province.getProvinceName();
        this.provincePostalCode = province.getProvincePostalCode();
    }

    @JsonProperty("id")
    public Integer getProvinceId() {
        return provinceId;
    }

    public String getProvinceName() {
        return provinceName;
    }

    public String getProvincePostalCode() {
        return provincePostalCode;
    }
    
    
}
