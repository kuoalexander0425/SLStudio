/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.sls.test;

import uuu.sls.entity.Customer;
import uuu.sls.entity.VIP;

/**
 *
 * @author Admin
 */
public class TestInstanceOf {
    public static void main(String[] args) {
        Customer c1 = new Customer();
        Customer c2 = new VIP();
        
        System.out.println(c1 instanceof Customer);//true
        System.out.println(c2 instanceof Customer);//true
        
        Object o = new Object();
        Customer c = new Customer();
        VIP v = new VIP();
        System.out.println(o instanceof Object);//true
        System.out.println(o instanceof Customer);//false
        System.out.println(o instanceof VIP);//false
        
        System.out.println(c instanceof Object);//true
        System.out.println(c instanceof Customer);//true
        System.out.println(c instanceof VIP);//false
        
        System.out.println(v instanceof Object);//true
        System.out.println(v instanceof Customer);//true
        System.out.println(v instanceof VIP);//true
        
            
        Object o100 = null;
        Customer c100 = null;
        VIP v100 = null;
        //檢查有無is的關聯 當是null時 就無法有任何關連
      
        System.out.println(o100 instanceof Object);//false
        System.out.println(o100 instanceof Customer);//false
        System.out.println(o100 instanceof VIP);//false
        
        System.out.println(c100 instanceof Object);//false
        System.out.println(c100 instanceof Customer);//false
        System.out.println(c100 instanceof VIP);//false
        
        System.out.println(v100 instanceof Object);//false
        System.out.println(v100 instanceof Customer);//false
        System.out.println(v100 instanceof VIP);//true
        
        
    }
}
