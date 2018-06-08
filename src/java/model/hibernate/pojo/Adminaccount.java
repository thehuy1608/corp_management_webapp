package model.hibernate.pojo;
// Generated Jun 1, 2018 5:38:26 PM by Hibernate Tools 4.3.1



/**
 * Adminaccount generated by hbm2java
 */
public class Adminaccount  implements java.io.Serializable {


     private int fkAdministratorId;
     private Administrator administrator;
     private String accountUsername;
     private String accountPassword;
     private String passwordSalt;

    public Adminaccount() {
    }

    public Adminaccount(Administrator administrator, String accountUsername, String accountPassword, String passwordSalt) {
       this.administrator = administrator;
       this.accountUsername = accountUsername;
       this.accountPassword = accountPassword;
       this.passwordSalt = passwordSalt;
    }
   
    public int getFkAdministratorId() {
        return this.fkAdministratorId;
    }
    
    public void setFkAdministratorId(int fkAdministratorId) {
        this.fkAdministratorId = fkAdministratorId;
    }
    public Administrator getAdministrator() {
        return this.administrator;
    }
    
    public void setAdministrator(Administrator administrator) {
        this.administrator = administrator;
    }
    public String getAccountUsername() {
        return this.accountUsername;
    }
    
    public void setAccountUsername(String accountUsername) {
        this.accountUsername = accountUsername;
    }
    public String getAccountPassword() {
        return this.accountPassword;
    }
    
    public void setAccountPassword(String accountPassword) {
        this.accountPassword = accountPassword;
    }
    public String getPasswordSalt() {
        return this.passwordSalt;
    }
    
    public void setPasswordSalt(String passwordSalt) {
        this.passwordSalt = passwordSalt;
    }




}


