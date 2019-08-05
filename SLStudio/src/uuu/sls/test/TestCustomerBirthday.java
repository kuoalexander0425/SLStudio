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

/**
 *
 * @author Admin
 */
public class TestCustomerBirthday {

    public static void main(String[] args) {
        try {
            Customer c = new Customer();
//            c.setOldBirthday("1992/01/15");
//            System.out.println(c.getOldBirthday());
            
            c.setOldBirthday("1990-02-28");
            System.out.println(c.getOldBirthday());

            c.setBirthday(1990, 2, 28);
            System.out.println(c.getBirthday());
            
            c.setBirthday("1992-2-28");
            System.out.println(c.getBirthday());
            
        } catch (SLSException ex) {
            if(ex.getCause()!= null){
            //Logger.getLogger(TestCustomerBirthday.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex +"\t" + ex.getCause());
        }else{
                System.out.println(ex);
                }
        } catch (Exception ex) {
            System.out.println("非預期錯誤: " + ex);
            Logger.getLogger("sls系統錯誤").log(Level.SEVERE, "發生非預期錯誤", ex);
        }
    }
}
