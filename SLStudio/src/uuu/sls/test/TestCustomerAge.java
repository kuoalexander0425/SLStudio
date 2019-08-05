/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.sls.test;

import java.time.LocalDate;
import java.time.Month;
import java.util.logging.Level;
import java.util.logging.Logger;
import uuu.sls.entity.Customer;
import uuu.sls.entity.SLSException;

/**
 *
 * @author Admin
 */
public class TestCustomerAge {
    public static void main(String[] args) {
        try {
            Customer c = new Customer();
            c.setBirthday(LocalDate.of(1999, 9, 9));
            
            int age = c.getAge();
            System.out.println("age = " + age);
            
            Customer c1 = new Customer();
            c1.setBirthday(2000, 2, 12);
            System.out.println(c1.getBirthday());
            System.out.println("c1.age =" + c1.getAge());
            
            Customer c2 = new Customer();
            c2.setBirthday("2001-02-02");
            System.out.println(c1.getBirthday());
            System.out.println("c2.age =" + c2.getAge());
            
            // c2.setBirthday(null);
            
            
            //順便測試Customer物件的check
            String id = "A123456789";
            if(Customer.checkId(id))
                //if(c.checkId(id)){
                //    c.setId(id);
                System.out.println(c.getId());
            //}else{
            //    System.out.println("id不正確");
        } catch (SLSException ex) {
            System.out.println("客戶年齡計算不正確:" + ex);
           // Logger.getLogger(TestCustomerAge.class.getName()).log(Level.SEVERE, null, ex);
        }catch(Exception ex){
             System.out.println("客戶年齡計算發生非預期錯誤: " + ex);
        }
        }
 }

