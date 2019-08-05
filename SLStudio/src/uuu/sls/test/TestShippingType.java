/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.sls.test;

import uuu.sls.entity.ShippingType;

/**
 *
 * @author alexanderkuo
 */
public class TestShippingType {
    public static void main(String[] args) {
        System.out.println(ShippingType.SELF.name());
         System.out.println(ShippingType.HOME);
         System.out.println(ShippingType.values());
    }
    
}
