/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.sls.test;

import java.util.logging.Level;
import java.util.logging.Logger;
import uuu.sls.entity.Customer;
import uuu.sls.entity.SLSException;
import uuu.sls.model.CustomerService;

/**
 *
 * @author Admin
 */
public class TestCustomerServiceUpdate {
    public static void main(String[] args) {
        
        try {
            CustomerService service = new CustomerService();
            Customer c = service.login("A123456789", "123456");
            System.out.println("c = " + c);
            c.setName("張三豐");
            c.setAddress("台北市復興北路101號2樓");
            service.update(c);
                    
            Customer c2 = service.login("A123456789", "123456");
            System.out.println("c = " + c2);
        } catch (SLSException ex) {
            Logger.getLogger(TestCustomerServiceUpdate.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
