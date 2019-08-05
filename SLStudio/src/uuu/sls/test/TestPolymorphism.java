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
public class TestPolymorphism {
    public static void main(String[] args) {
        try {
            Object o = new Object();
            String s = "Hello";
            Customer c = new Customer("A123456789", "John", "123456");
            
            //多形 Polymorphism
            Object o1 = "Hello";
            //System.out.println(o1.length());
            //System.out.println(o1.getClass().getName());
            System.out.println(o1);//o1.toString()
            //轉型(Casting)前須先用instanceof檢查型別
            if(o1 instanceof String){
                String s1 = (String)o1;//轉型(Casting)
                System.out.println(s1.length());
            }
            
            o1 = new Customer("A223456781", "Mary", "123456");
            //System.out.println(o1.getName());
            System.out.println(o1.getClass().getName());
            System.out.println(o1.toString());
            //轉型(Casting)前須先用instanceof檢查型別
            if(o1 instanceof Customer){
                System.out.println(((Customer)o1).getName());
            }
            
            o1 = 1;
            //System.out.println(o1.inValue());
            System.out.println(o1.getClass().getName());
            System.out.println(o1.toString());
            //轉型(Casting)前須先用instanceof檢查型別
            if(o1 instanceof Integer){
                System.out.println((Integer)o1 + 1);
            }
            
            //Double a = 1; //auto-boxing + polymorphism
            Number a = 1; //auto-boxing + polymorphism
            //1在此為Integer (1)(包裝), 其為Number的子類別(多形)
        } catch (SLSException ex) {
            Logger.getLogger(TestEquals.class.getName()).log(Level.SEVERE, "多型測試發生錯誤", ex);
        } catch(Exception ex) {
            Logger.getLogger(TestEquals.class.getName()).log(Level.SEVERE, "多型測試發生非預期錯誤", ex);
        }
    }
}
