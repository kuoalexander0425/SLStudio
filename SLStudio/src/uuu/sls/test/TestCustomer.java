/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.sls.test;

import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;
import uuu.sls.entity.Customer;
import uuu.sls.entity.SLSException;

/**
 *這是Customer類別的單元測試(Unit Test),可以用JUnit工具產生
 * @author Admin
 */
public class TestCustomer {
    public static void main(String[] args) {
        try {
            Customer c = new Customer();
            //c.id = "A123456789";
            c.setId(new String("A123456789"));
            
            System.out.println("c.id = " + c.getId());
            
            c.setPassword("123456");
            System.out.println("c.password = " + c.getPassword());
            
            c.setName("羅時豐");
            System.out.println("c.name = " + c.getName());
            
            c.setEmail("abc@gmail.com");
            System.out.println("c.email = " + c.getEmail());
            
            c.setGender('M');
            System.out.println("c.gender = " + (c.getGender() == Customer.MALE?'男':'女'));
            
            c.setBirthday(LocalDate.of(1999, 10, 28));
            System.out.println("c.birthday = " + c.getBirthday());
            
            c.setPhone("27654893");
            System.out.println("c.phone = " + c.getPhone());
            
            c.setAddress("台北市林森北路一段46號");
            System.out.println("c.address = " + c.getAddress());
        }catch(SLSException ex){
            System.out.println("客戶資料不正確:" + ex);
            //Logger.getLogger(TestCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }catch(Exception ex){
            System.out.println("客戶資料處理發生非預期錯誤: " + ex);
        }
    }
}
