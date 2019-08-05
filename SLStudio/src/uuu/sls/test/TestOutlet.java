/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.sls.test;

import uuu.sls.entity.Outlet;
import uuu.sls.entity.Product;

/**
 *
 * @author Admin
 */
public class TestOutlet {
    public static void main(String[] args) {
        Outlet outlet = new Outlet();
        outlet.setId(1);
        outlet.setName("Midori MD色鉛筆");
        outlet.setUnitPrice(320);
        outlet.setDiscount(15);
        outlet.setPhotoURL(".....");
        outlet.setDescription("...........");
        
        System.out.println(outlet.getId());
        System.out.println(outlet.getName());
        System.out.println(outlet.getUnitPrice());
        System.out.println(outlet.getDiscount());
        System.out.println(outlet.getDiscountString());
        //System.out.println(outlet.getUnitPrice()*(100-outlet.getDiscount())/100);
        System.out.println(outlet.getPhotoURL());
        System.out.println(outlet.getDescription());
        System.out.println(outlet.getListPrice());
        
 
        System.out.println("折扣產品:\n" + outlet.toString());
        
        Product p = new Product(1, "mouse", 200);
        Product p2 = p.clone();
        System.out.println(p!=p2);
        System.out.println(p.getClass() ==p2.getClass());
        System.out.println(p.equals(p2));
    }
   
}
