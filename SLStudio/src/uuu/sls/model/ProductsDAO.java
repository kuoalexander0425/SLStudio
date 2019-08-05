/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.sls.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import uuu.sls.entity.Outlet;
import uuu.sls.entity.Product;
import uuu.sls.entity.SLSException;

/**
 *
 * @author Admin
 */
class ProductsDAO {

    private static final String SELECT_ALL_PRODUCT
            = "SELECT id, name,photo_url,description, discount,class_name,brand_name FROM products";

    List<Product> getAllProducts() throws SLSException {
        List<Product> list = new ArrayList<>();
        //2.取得連線
        try (Connection connection = RDBConnection.getConnection();
                //3.建立指令
                Statement stmt = connection.createStatement();
                //4.執行指令
                ResultSet rs = stmt.executeQuery(SELECT_ALL_PRODUCT);) {
            while (rs.next()) {
                Product p;
                String className = rs.getString("class_name");
                if (className != null && className.equals("outlet")) {
                    p = new Outlet();
                    ((Outlet) p).setDiscount(rs.getInt("discount"));
                } else {
                    p = new Product();
                }
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name")); 
//                p.setSize(rs.getInt("size"));
//                p.setUnitPrice(rs.getDouble("unit_price"));
//                p.setStock(rs.getInt("stock"));
                p.setPhotoURL(rs.getString("photo_url"));
                p.setDescription(rs.getString("description"));
                p.setBrandName(rs.getString("brand_name"));
               
                list.add(p);

            }
        } catch (SQLException ex) {
            throw new SLSException("查詢全部商品失敗", ex);
        }

        return list;

    }

    private static final String SELECT_PRODUCT_BY_NAME
            = "SELECT id, name,photo_url,description, discount,class_name,brand_name FROM products WHERE name LIKE ?";

    List<Product> getProductsByName(String name)
            throws SLSException {
        List<Product> list = new ArrayList<>();
        //2.取得連線
        try (Connection connection = RDBConnection.getConnection();
                //3.準備指令
                PreparedStatement pstmt = connection.prepareStatement(SELECT_PRODUCT_BY_NAME); //3.1 傳入?的值
                ) {
            pstmt.setString(1, '%' + name + '%');
            //4.執行指令
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Product p;
                String className = rs.getString("class_name");
                if (className != null && className.equals("outlet")) {
                    p = new Outlet();
                    ((Outlet) p).setDiscount(rs.getInt("discount"));
                } else {
                    p = new Product();
                }
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
//                p.setSize(rs.getInt("size"));
//                p.setUnitPrice(rs.getDouble("unit_price"));
//                p.setStock(rs.getInt("stock"));
                p.setPhotoURL(rs.getString("photo_url"));
                p.setDescription(rs.getString("description"));
                p.setBrandName(rs.getString("brand_name"));
                
                list.add(p);
            }
        } catch (SQLException ex) {
            throw new SLSException("查詢商品失敗", ex);
        }
        return list;
    }

    private static final String SELECT_PRODUCT_BY_ID
            = "SELECT id, name,size, unit_price, stock,photo_url,description, discount,class_name,brand_name " 
            + "FROM products JOIN products_size ON id=product_id WHERE id=?";

    Product getProductById(String id) throws SLSException {
        Product p = null;
        //2.取得連線
        try (Connection connection = RDBConnection.getConnection();
                //3.建立指令
                PreparedStatement pstmt = connection.prepareStatement(SELECT_PRODUCT_BY_ID); //3.1 傳入?的值               
                ) {
            pstmt.setString(1, id);
            //4.執行指令
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                if(p==null){
                    String className = rs.getString("class_name");
                    if (className != null && className.equals("outlet")) {
                        p = new Outlet();
                        ((Outlet) p).setDiscount(rs.getInt("discount"));
                    } else {
                        p = new Product();
                    }
                    p.setId(rs.getInt("id"));
                    p.setName(rs.getString("name"));
//                    p.setSize(rs.getInt("size"));
//                    p.setUnitPrice(rs.getDouble("unit_price"));
                    p.setStock(rs.getInt("stock"));
                    p.setPhotoURL(rs.getString("photo_url"));
                    p.setDescription(rs.getString("description"));
                    p.setBrandName(rs.getString("brand_name"));
                }
                int size = rs.getInt("size");
                double price = rs.getDouble("unit_price");
                p.add(size, price);
            }
            return p;
        } catch (SQLException ex) {
            throw new SLSException("查詢商品失敗", ex);
        }        //To change body of generated methods, choose Tools | Templates.        //To change body of generated methods, choose Tools | Templates.        //To change body of generated methods, choose Tools | Templates.        //To change body of generated methods, choose Tools | Templates.
    }
}
