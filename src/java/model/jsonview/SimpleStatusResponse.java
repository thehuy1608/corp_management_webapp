/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.jsonview;

/**
 *
 * @author WIN 10
 */
public class SimpleStatusResponse {
    private final String response_code;
    private final String response_status;

    public SimpleStatusResponse(String response_code, String response_status) {
        this.response_code = response_code;
        this.response_status = response_status;
    }

    public String getResponse_code() {
        return response_code;
    }

    public String getResponse_status() {
        return response_status;
    }
    
    
}
