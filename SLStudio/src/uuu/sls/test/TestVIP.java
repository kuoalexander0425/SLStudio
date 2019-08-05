/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.sls.test;

import java.util.logging.Level;
import java.util.logging.Logger;
import uuu.sls.entity.SLSException;
import uuu.sls.entity.VIP;

/**
 *
 * @author Admin
 */
public class TestVIP {
    public static void main(String[] args) {
        try {
            VIP vip = new VIP();
            vip.setId("A123456789");
            vip.setName("羅時豐");
            System.out.println("vip.getId() = " + vip.getId());
            
            System.out.println(vip.getDiscountString());
            vip.setDiscount(15);
            System.out.println(vip.getDiscountString());
            System.out.println("vip: " + vip.toString());
        } catch (SLSException ex) {
            Logger.getLogger(TestVIP.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
}
