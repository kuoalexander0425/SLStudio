/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.sls.entity;

import java.util.Objects;

/**
 *
 * @author Admin
 */
public class CartItem {
      private Product product;
      private String color="";
      private int size;

    public CartItem() {
    }

    public CartItem(Product product, String color, Integer size) {
        this.product = product;
        this.color = color;
        this.size = size;
    }

    public CartItem(Product product, int size) {
        this.product = product;
        this.size = size;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    @Override
    public String toString() {
        return "購物明細{產品" + product +"顏色"+ color + "容量" + size + "}"; //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 89 * hash + Objects.hashCode(this.product);
        hash = 89 * hash + Objects.hashCode(this.color);
        hash = 89 * hash + Objects.hashCode(this.size);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final CartItem other = (CartItem) obj;
        if (!Objects.equals(this.color, other.color)) {
            return false;
        }
        if (!Objects.equals(this.product, other.product)) {
            return false;
        }
        if (!Objects.equals(this.size, other.size)) {
            return false;
        }
        return true;
    }
      
    
    
}
