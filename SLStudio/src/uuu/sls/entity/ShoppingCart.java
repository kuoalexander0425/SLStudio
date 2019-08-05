/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.sls.entity;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 *
 * @author Admin
 */
public class ShoppingCart {

    private Customer user;
    private Map<CartItem, Integer> cart = new HashMap<>();
    //null會等於沒有 但new是有建立起來(集合物件不能寫getter&setter)

    public Customer getUser() {
        return user;
    }

    public void setUser(Customer user) {
        this.user = user;
    }

    //修改cart的內容 mutators
    public void addCart(Product p, int quantity, int size) {
        if (p == null) {
            throw new IllegalArgumentException("加入購物車產品不得為null");
        }
        if (quantity < 1) {
            throw new IllegalArgumentException("加入購物車產品數量不得為小於1");
        }
//        if (color == null) {
//            color = "";
//        }
        if (size < 1) {
            throw new IllegalArgumentException("請加入購物車不得為小於1");
        }
        CartItem item = new CartItem(p, size);
        Integer oldQuantity = cart.get(item);
        if (oldQuantity == null) {
            cart.put(item, quantity);//放入(新增與修改)
        } else {
            cart.put(item, quantity + oldQuantity);
        }
    }

    public void addCart(Product p, int quantity) {
        this.addCart(p, quantity, 1);
    }

    public void updateCart(CartItem item, int quantity) {
        Integer oldQuantity = cart.get(item);
        if (oldQuantity != null) {
            cart.put(item, quantity);
        }
    }

    public void removeCart(CartItem item) {
        cart.remove(item);
    }

//TODO:購物明細
//讀取cart的內容 accessors
    public int size() {
        return cart.size();
    }

    public boolean isEmpty() {
        return cart.isEmpty();
        //幫助做迴圈檢查用
    }

    public int getTotalQuantity() {
        int sum = 0;
        for (Integer q : cart.values()) {
            if (q != null) {
                sum += q;
            }
        }
        return sum;
    }

    public double getTotalAmount() {
        double sum = 0;
        for (CartItem item : cart.keySet()) {
            Integer q = cart.get(item);
            if (q != null) {
                sum += q * item.getProduct().getPrice(item.getSize());
                //拿到的數乘上售價等於總金額
            }
        }
        return Math.round(sum);
    }

    public double getVIPTotalAmount() {
        if (this.user instanceof VIP) {
            double sum = 0;
            for (CartItem item : cart.keySet()) {
                Integer q = cart.get(item);
                
                if (q != null) {
                    double amount = q * item.getProduct().getPrice(item.getSize());
                    if (user instanceof VIP && !(item.getProduct() instanceof Outlet)) {
                        amount = amount * (100 - ((VIP) user).getDiscount()) / 100;
                    }
                    sum += amount;
                }
            }
            return Math.round(sum);

        } else {
            return getTotalAmount();
        }
    }

    public Set<CartItem> getCartItemSet() {
        return cart.keySet();
    }

    public Integer getQuantity(CartItem key) {
        Integer quantity = cart.get(key);
        return quantity != null ? quantity : 0;
    }

    public String getDiscount(CartItem key) {
        int discount = 0;
        String vip = "";
        if (key.getProduct() instanceof Outlet) {
            discount = ((Outlet) key.getProduct()).getDiscount();
        } else if (this.user instanceof VIP) {
            discount = ((VIP) user).getDiscount();
            vip = "VIP";
        }
        if (discount != 0) {
            int off = 100 - discount;
            if (off % 10 != 0) {
                return vip + off + "折";
            } else {
                return vip + off / 10 + "折";
            }
        } else {
            return "";
        }
    }

    public double getPrice(CartItem key) {
        int discount = 0;
        if (key.getProduct() instanceof Outlet) {
            discount = ((Outlet) key.getProduct()).getDiscount();
        } else if (this.user instanceof VIP) {
            discount = ((VIP) user).getDiscount();
        }
        
        
        double price = key.getProduct().getPrice(key.getSize());

        if (discount != 0 && !(key.getProduct() instanceof Outlet)) {
            price = price * (100 - discount) / 100;
        }
        return price;
    }
}
