/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.sls.entity;

import java.text.NumberFormat;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.TreeMap;

/**
 *
 * @author Admin
 */
public class Product {

    private int id;//必要, auto increment, Pkey
    private String name;
    private String brandName;
    private String photoURL;
    private String description;

    //for size-to-price management
    private Map<Integer, Double> sizeMap = new TreeMap<>();

    public int mapSize() {
        return sizeMap.size();
    }

    public Double add(int size, double price) {
        return sizeMap.put(size, price);
    }

    public Set<Integer> getSizeSet() {
        return sizeMap.keySet();
    }

    public Double getPrice(int size) {
        return sizeMap.get(size);
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public static final NumberFormat PRICE_FORMAT;

    static {
        PRICE_FORMAT = NumberFormat.getNumberInstance();
        PRICE_FORMAT.setMinimumFractionDigits(0);
        PRICE_FORMAT.setMaximumFractionDigits(2);
    }

    public Product() {

    }

    public Product(int id, String name, double unitPrice) {
        this.id = id;
        this.name = name;
        this.unitPrice = unitPrice;
    }

    public Product(Product p) {
        if (p != null) {
            this.id = p.id;
            this.name = p.name;
            this.unitPrice = p.unitPrice;
            this.stock = p.stock;
            this.photoURL = p.photoURL;
            this.description = p.description;
            this.size = p.size;
            this.brandName = p.brandName;
        }
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Deprecated
    public double getUnitPrice() {
        return unitPrice;
    }

    @Deprecated
    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    @Deprecated
    public int getStock() {
        return stock;
    }

    @Deprecated
    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getPhotoURL() {
        return photoURL;
    }

    public void setPhotoURL(String photoURL) {
        this.photoURL = photoURL;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public Product clone() {
        Product p = new Product(); //To change body of generated methods, choose Tools | Templates.
        p.id = this.id;
        p.name = this.name;
        p.unitPrice = this.unitPrice;
        p.size = this.size;
        p.brandName = this.brandName;
        return p;
    }

    @Override
    public String toString() {
        return this.getClass().getName()
                + "\n  產品編號: " + id
                + "\n  產品名稱: " + name
                + "\n  定價: " + unitPrice
                + "\n  庫存: " + stock
                + "\n  圖片: " + photoURL
                + "\n  描述: " + description
                + "\n  容量: " + size
                + "\n  廠商: " + brandName;
    }

    @Override
    protected void finalize() throws Throwable {
        super.finalize(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int hashCode() {
        return super.hashCode(); //To change body of generated methods, choose Tools | Templates.
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
        final Product other = (Product) obj;
        if (this.id != other.id) {
            return false;
        }
        if (Double.doubleToLongBits(this.unitPrice) != Double.doubleToLongBits(other.unitPrice)) {
            return false;
        }
        if (this.stock != other.stock) {
            return false;
        }
        if (this.size != other.size) {
            return false;
        }
        if (!Objects.equals(this.name, other.name)) {
            return false;
        }
        if (!Objects.equals(this.brandName, other.brandName)) {
            return false;
        }
        if (!Objects.equals(this.photoURL, other.photoURL)) {
            return false;
        }
        if (!Objects.equals(this.description, other.description)) {
            return false;
        }
        return true;
    }

//deprecated
    protected double unitPrice;
    private int stock;
    private int size;

    @Deprecated
    public int getSize() {
        return size;
    }

    @Deprecated
    public void setSize(int size) {
        this.size = size;
    }

    

}
