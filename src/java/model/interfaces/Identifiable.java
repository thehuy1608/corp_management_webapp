/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.interfaces;

/**
 *
 * @author WIN 10
 */
public interface Identifiable extends org.springframework.hateoas.Identifiable<Integer> {
    public void setId(int id);
}
