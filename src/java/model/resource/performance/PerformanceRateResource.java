/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.resource.performance;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;
import java.util.Date;
import model.hibernate.pojo.Performance;
import org.springframework.hateoas.ResourceSupport;

/**
 *
 * @author WIN 10
 */
public class PerformanceRateResource extends ResourceSupport {

    private Integer performanceId;
    private final Integer administratorId;
    private final Integer employeeID;
    private final int performanceResult;
    private final String performanceDescription;
    private final Date performanceAddedDate;
    private final Date performanceModifiedDate;
    
    public PerformanceRateResource(Performance performance) {
        this.performanceId = performance.getPerformanceId();
        this.administratorId = performance.getAdministrator().getAdministratorId();
        this.employeeID = performance.getEmployee().getEmployeeId();
        this.performanceResult = performance.getPerformanceResult();
        this.performanceDescription = performance.getPerformanceDescription();
        this.performanceAddedDate = performance.getPerformanceAddedDate();
        this.performanceModifiedDate = performance.getPerformanceModifiedDate();
    }

    @JsonCreator
    public PerformanceRateResource(
            @JsonProperty("administratorId") Integer administratorId,
            @JsonProperty("employeeId") Integer employeeID,
            @JsonProperty("performanceResult") int performanceResult,
            @JsonProperty("performanceDescription") String performanceDescription,
            @JsonProperty("performanceAddedDate") Date performanceAddedDate,
            @JsonProperty("performanceModifiedDate") Date performanceModifiedDate) {
        this.administratorId = administratorId;
        this.employeeID = employeeID;
        this.performanceResult = performanceResult;
        this.performanceDescription = performanceDescription;
        this.performanceAddedDate = performanceAddedDate;
        this.performanceModifiedDate = performanceModifiedDate;
    }

    @JsonProperty("id")
    public Integer getPerformanceId() {
        return performanceId;
    }

    public Integer getAdministratorId() {
        return administratorId;
    }

    public Integer getEmployeeID() {
        return employeeID;
    }

    public int getPerformanceResult() {
        return performanceResult;
    }

    public String getPerformanceDescription() {
        return performanceDescription;
    }

    public Date getPerformanceAddedDate() {
        return performanceAddedDate;
    }

    public Date getPerformanceModifiedDate() {
        return performanceModifiedDate;
    }

}
