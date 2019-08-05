/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.sls.test;

import uuu.sls.entity.PaymentType;
import uuu.sls.entity.ShippingType;

/**
 *
 * @author Admin
 */
public class TestPaymentType {
    public static void main(String[] args) {
        System.out.println(PaymentType.HOME);
        System.out.println(ShippingType.HOME);
        System.out.println(PaymentType.CARD);
        System.out.println(ShippingType.STORE);
    }
}


