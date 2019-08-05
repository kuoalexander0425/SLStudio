/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.sls.test;

import java.util.logging.Level;
import java.util.logging.Logger;
import uuu.sls.entity.*;

/**
 *
 * @author Admin
 */
public class TestEquals {

    public static void main(String[] args) {
        try {
            Customer c = new Customer("A123456789", "羅時豐", "123456");
            Customer c2 = new Customer("A123456789", "羅時豐", "123456");
            VIP c3 = new VIP("A123456789", "羅時豐", "123456", 15);
            VIP c4 = new VIP("A123456789", "羅時豐", "123456", 15);

            System.out.println(c == c2);//false
            System.out.println(c == c3);//false
            //System.out.println(c == p);compile-time error
            System.out.println(c2.equals(c));//true
            System.out.println(c.equals(c3));//true
            System.out.println(c3.equals(c4));//true

            Product p = new Product(1, "mouse", 200);
            Product p2 = new Product(1, "mouse", 200);
            Outlet p3 = new Outlet(1, "mouse", 200, 50);

            System.out.println(p == p2);//false
            System.out.println(p == p3);//false
            System.out.println(p.equals(p2));//true
            System.out.println(p.equals(p3));//false
        } catch (SLSException ex) {
            Logger.getLogger(TestEquals.class.getName()).log(Level.SEVERE, "Customer equals比較發生錯誤", ex);
        } catch (Exception ex) {
            Logger.getLogger(TestEquals.class.getName()).log(Level.SEVERE, "Customer equals比較發生非預期錯誤", ex);
        }
    }
}
