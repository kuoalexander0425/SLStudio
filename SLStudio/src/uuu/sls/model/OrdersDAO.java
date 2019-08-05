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
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import uuu.sls.entity.Customer;
import uuu.sls.entity.Order;
import uuu.sls.entity.OrderItem;
import uuu.sls.entity.PaymentType;
import uuu.sls.entity.Product;
import uuu.sls.entity.ShippingType;
import uuu.sls.entity.SLSException;

/**
 *
 * @author Admin
 */
class OrdersDAO {

//    private static final String UPDATE_PRODUCT_STOCK = "UPDATE products SET stock=stock-? WHERE id=? AND stock>=?";
    private static final String INSERT_ORDER = "INSERT INTO "
            + "orders(id,customer_id,order_date,order_time,addressee_name,addressee_email,"
            + "addressee_phone,shipping_address,payment_type,"
            + "payment_fee,shipping_type,shipping_fee) "
            + "values(?,?,?,?,?,?,?,?,?,?,?,?)";

    private static final String INSERT_ORDER_ITEMS = "INSERT INTO "
            + "order_items(order_id,product_id,size,price,quantity)\n"
            + "values(?,?,?,?,?)";

    public void insert(Order order) throws SLSException {
        try (Connection connection = RDBConnection.getConnection();//1.2.取得連線
                PreparedStatement pstmt1 = connection.prepareStatement(INSERT_ORDER, Statement.RETURN_GENERATED_KEYS);//3.準備指令
                PreparedStatement pstmt2 = connection.prepareStatement(INSERT_ORDER_ITEMS);//3.準備指令
                ) {

            try {
                //begin tran: setAutoCommit(false):
                connection.setAutoCommit(false);

                //3.1傳入pstmt1?的值
                pstmt1.setInt(1, order.getId());
                pstmt1.setString(2, order.getUser().getId());
                pstmt1.setString(3, order.getOrderDate().toString());
                pstmt1.setString(4, order.getOrderTime().toString());
                pstmt1.setString(5, order.getAddresseeName());
                pstmt1.setString(6, order.getAddresseeEmail());
                pstmt1.setString(7, order.getAddresseePhone());
                pstmt1.setString(8, order.getShippingAddress());
                pstmt1.setString(9, order.getPaymentType().name());
                pstmt1.setDouble(10, order.getPaymentFee());
                pstmt1.setString(11, order.getShippingType().name());
                pstmt1.setDouble(12, order.getShippingFee());

                pstmt1.executeUpdate();//4.執行指令

                //4.1取回autoincremont的key值
                try (ResultSet rs = pstmt1.getGeneratedKeys()) {
                    while (rs.next()) {
                        order.setId(rs.getInt(1));
                    }
                }

                for (OrderItem item : order.getOrderItemSet()) {
                    //3.1傳入pstmt2 ?的值
                    pstmt2.setInt(1, order.getId());
                    pstmt2.setInt(2, item.getProduct().getId());
                    pstmt2.setInt(3, item.getSize());
                    pstmt2.setDouble(4, item.getPrice());
                    pstmt2.setInt(5, item.getQuantity());
                    pstmt2.executeUpdate();//4.執行
                }
                //commit
                connection.commit();

            } catch (Exception ex) {
                //rollback
                connection.rollback();
                throw ex;
            } finally {
                //setAutoCommit(true):
                connection.setAutoCommit(true);
            }
        } catch (SQLException ex) {
            throw new SLSException("建立連線失敗", ex);
        }
    }
    private static final String SELECT_ORDERS_BY_CUSTOMER_ID = "SELECT orders.id,customer_id, name,"
            + " order_date,IFNULL(SUM(price*quantity),0) as total_amount,"
            + "payment_type,shipping_type,payment_fee,shipping_fee FROM orders\n"
            + "JOIN customers ON orders.customer_id = customers.id AND customers.id =?\n"
            + "LEFT JOIN order_items ON orders.id = order_items.order_id\n"
            + "GROUP BY orders.id ORDER BY order_date DESC, order_time DESC;";

    public List<Order> getOrdersByCustomerId(String customerId) throws SLSException {
        try (Connection connection = RDBConnection.getConnection();//1.2.取得連線
                PreparedStatement pstmt = connection.prepareStatement(SELECT_ORDERS_BY_CUSTOMER_ID);//3.準備指令
                ) {

            //3.1傳入?的值
            pstmt.setString(1, customerId);

            //4.執行指令
            ResultSet rs = pstmt.executeQuery();

            //5.處理rs
            List<Order> list = new ArrayList<>();
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("id"));
                Customer user = new Customer();
                user.setId(rs.getString("customer_id"));
                user.setName(rs.getString("name"));
                order.setUser(user);
                
                String oDate = rs.getString("order_date");
                order.setOrderDate(LocalDate.parse(oDate));
//                String oTime = rs.getString("order_time");
//                 order.setOrderDate(LocalDate.parse(oTime));

                String paymentType = rs.getString("payment_type");
                try {
                    PaymentType pType = PaymentType.valueOf(paymentType);
                    order.setPaymentType(pType);
                } catch (Exception ex) {
                    System.out.println("讀取歷史訂單時時付款方式資料不正確" + paymentType);
                }
                String shippingType = rs.getString("shipping_type");
                try {
                    ShippingType shType = ShippingType.valueOf(shippingType);
                    order.setShippingType(shType);
                } catch (Exception ex) {
                    System.out.println("讀取歷史訂單時時貨運方式資料不正確" + shippingType);
                }
                order.setPaymentFee(rs.getDouble("payment_fee"));
                //有資料就可讀 沒allow null就不用檢查              
                order.setShippingFee(rs.getDouble("shipping_fee"));
                order.setTotalAmount(rs.getDouble("total_amount"));

                list.add(order);
            }
            return list;
        } catch (SQLException ex) {
            throw new SLSException("查詢客戶歷史訂單失敗", ex);
        }
    }
    private static final String SELECT_ORDER_BY_ID 
           = "SELECT orders.id, customer_id, customers.name, order_date, order_time, payment_type,payment_fee,"
            + "shipping_type,shipping_fee, shipping_note, payment_note,status,"
            + "addressee_name,addressee_email,addressee_phone,shipping_address,"
            + "product_id,size,price,quantity, products.name as product_name, photo_url "
            + "FROM orders JOIN customers ON orders.customer_id = customers.id "
            + "LEFT JOIN order_items ON orders.id = order_items.order_id "
            + "JOIN products ON order_items.product_id = products.id "
            + "WHERE orders.id=?";

    public Order getOrdersById(int id) throws SLSException {
        try (Connection connection = RDBConnection.getConnection();//1.2.取得連線
                PreparedStatement pstmt = connection.prepareStatement(SELECT_ORDER_BY_ID);//3.準備指令
                ) {
            //3.1傳入?的值
            pstmt.setInt(1, id);

            //4.執行指令
            ResultSet rs = pstmt.executeQuery();

            //5.處理rs
            Order order = null;
            while (rs.next()) {
                if (order == null) {
                    order = new Order();
                    order.setId(rs.getInt("id"));
                    Customer user = new Customer();
                    user.setId(rs.getString("customer_id"));
                    user.setName(rs.getString("name"));
                    order.setUser(user);
                    
                    String oDate = rs.getString("order_date");
                    order.setOrderDate(LocalDate.parse(oDate));
                    String oTime = rs.getString("order_time");
                    order.setOrderTime(LocalTime.parse(oTime));

                    String paymentType = rs.getString("payment_type");
                    try {
                        PaymentType pType = PaymentType.valueOf(paymentType);
                        order.setPaymentType(pType);
                    } catch (Exception ex) {
                        System.out.println("讀取歷史訂單時時付款方式資料不正確" + paymentType);
                    }
                    String shippingType = rs.getString("shipping_type");
                    try {
                        ShippingType shType = ShippingType.valueOf(shippingType);
                        order.setShippingType(shType);
                    } catch (Exception ex) {
                        System.out.println("讀取歷史訂單時時貨運方式資料不正確" + shippingType);
                    }
                    order.setPaymentFee(rs.getDouble("payment_fee"));
                    //有資料就可讀 沒allow null就不用檢查              
                    order.setShippingFee(rs.getDouble("shipping_fee"));
                    order.setPaymentNote(rs.getString("payment_note"));
                    order.setShippingNote(rs.getString("shipping_note"));
                    order.setAddresseeEmail(rs.getString("addressee_email"));
                    order.setAddresseeName(rs.getString("addressee_name"));
                    order.setAddresseePhone(rs.getString("addressee_phone"));
                    order.setShippingAddress(rs.getString("shipping_address"));
                    order.setStatus(rs.getInt("status"));

                }
                OrderItem item = new OrderItem();
                item.setOrderId(order.getId());
                item.setPrice(rs.getDouble("price"));
                item.setSize(rs.getInt("size"));
                item.setQuantity(rs.getInt("quantity"));

                Product p = new Product();
                p.setId(rs.getInt("product_id"));
                p.setName(rs.getString("product_name"));
                item.setSize(rs.getInt("size"));
                p.setPhotoURL(rs.getString("photo_url"));
                item.setProduct(p);
                order.addOrderItem(item);
            }
            return order;
        } catch (SQLException ex) {
            throw new SLSException("查詢訂單失敗", ex);
        }

    }
}
