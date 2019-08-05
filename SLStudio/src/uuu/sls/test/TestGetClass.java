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
public class TestGetClass {
    public static void main(String[] args) {
        Object o = new Object();
        Customer c = new Customer();
        VIP v = new VIP();
      
        System.out.println(o.getClass() == Object.class);//true
        System.out.println(o.getClass() == Customer.class);//false
        System.out.println(o.getClass() == VIP.class);//false
        
        //System.out.println(c.getClass() == Object.class);compile-time error
        System.out.println(c.getClass() == Customer.class);//true
        System.out.println(v.getClass() == VIP.class);//false
        
        //System.out.println(v.getClass() == Object.class);compile-time error
        //System.out.println(v.getClass() == Customer.class);compile-time error
        System.out.println(v.getClass() == VIP.class);//true
        
        Object o100 = null;
        Customer c100 = null;
        VIP v100 = null;
        
        System.out.println(o100.getClass() == Object.class);//run-time error
        System.out.println(o100.getClass() == Customer.class);//run-time error
        System.out.println(o100.getClass() == VIP.class);//run-time error
        
        //System.out.println(c100.getClass() == Object.class);compile-time error
        System.out.println(c100.getClass() == Customer.class);//run-time error
        System.out.println(c100.getClass() == VIP.class);//run-time error
        
        //System.out.println(v100.getClass() == Object.class);compile-time error
        //System.out.println(v100.getClass() == Customer.class);compile-time error
        System.out.println(v100.getClass() == VIP.class);//run-time error
    }
    
}
