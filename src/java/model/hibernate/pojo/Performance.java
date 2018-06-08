package model.hibernate.pojo;
// Generated Jun 1, 2018 5:38:26 PM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Performance generated by hbm2java
 */
public class Performance  implements java.io.Serializable {


     private Integer performanceId;
     private Administrator administrator;
     private Employee employee;
     private int performanceResult;
     private String performanceDescription;
     private Date performanceAddedDate;
     private Date performanceModifiedDate;

    public Performance() {
    }

    public Performance(Administrator administrator, Employee employee, int performanceResult, String performanceDescription, Date performanceAddedDate, Date performanceModifiedDate) {
       this.administrator = administrator;
       this.employee = employee;
       this.performanceResult = performanceResult;
       this.performanceDescription = performanceDescription;
       this.performanceAddedDate = performanceAddedDate;
       this.performanceModifiedDate = performanceModifiedDate;
    }
   
    public Integer getPerformanceId() {
        return this.performanceId;
    }
    
    public void setPerformanceId(Integer performanceId) {
        this.performanceId = performanceId;
    }
    public Administrator getAdministrator() {
        return this.administrator;
    }
    
    public void setAdministrator(Administrator administrator) {
        this.administrator = administrator;
    }
    public Employee getEmployee() {
        return this.employee;
    }
    
    public void setEmployee(Employee employee) {
        this.employee = employee;
    }
    public int getPerformanceResult() {
        return this.performanceResult;
    }
    
    public void setPerformanceResult(int performanceResult) {
        this.performanceResult = performanceResult;
    }
    public String getPerformanceDescription() {
        return this.performanceDescription;
    }
    
    public void setPerformanceDescription(String performanceDescription) {
        this.performanceDescription = performanceDescription;
    }
    public Date getPerformanceAddedDate() {
        return this.performanceAddedDate;
    }
    
    public void setPerformanceAddedDate(Date performanceAddedDate) {
        this.performanceAddedDate = performanceAddedDate;
    }
    public Date getPerformanceModifiedDate() {
        return this.performanceModifiedDate;
    }
    
    public void setPerformanceModifiedDate(Date performanceModifiedDate) {
        this.performanceModifiedDate = performanceModifiedDate;
    }




}

