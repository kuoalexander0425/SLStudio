package uuu.sls.entity;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

public class Order {

    private int id; //PKey,自動給號
    private Customer user; //訂購人
    private LocalTime orderTime = LocalTime.now();
    private LocalDate orderDate = LocalDate.now();

    private String addresseeName;
    private String addresseeEmail;
    private String addresseePhone;
    private String shippingAddress;

    private double paymentFee;
    private double shippingFee;
    private String paymentNote;
    private String shippingNote;
    private PaymentType paymentType;
    private ShippingType shippingType;

    private int status;//0-NEW, 1-PAID,2-SHIPPED, 3-ARRIVED	

    private Set<OrderItem> orderItemSet = new HashSet<>();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Customer getUser() {
        return user;
    }

    public void setUser(Customer user) {
        this.user = user;
    }

    public LocalTime getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(LocalTime orderTime) {
        this.orderTime = orderTime;
    }

    public LocalDate getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(LocalDate orderDate) {
        this.orderDate = orderDate;
    }

    public String getAddresseeName() {
        return addresseeName;
    }

    public void setAddresseeName(String addresseeName) {
        this.addresseeName = addresseeName;
    }

    public String getAddresseeEmail() {
        return addresseeEmail;
    }

    public void setAddresseeEmail(String addresseeEmail) {
        this.addresseeEmail = addresseeEmail;
    }

    public String getAddresseePhone() {
        return addresseePhone;
    }

    public void setAddresseePhone(String addresseePhone) {
        this.addresseePhone = addresseePhone;
    }

    public String getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(String shippingAddress) {
        this.shippingAddress = shippingAddress;
    }

    public double getPaymentFee() {
        return paymentFee;
    }

    public void setPaymentFee(double paymentFee) {
        this.paymentFee = paymentFee;
    }

    public double getShippingFee() {
        return shippingFee;
    }

    public void setShippingFee(double shippingFee) {
        this.shippingFee = shippingFee;
    }

    public String getPaymentNote() {
        return paymentNote;
    }

    public void setPaymentNote(String paymentNote) {
        this.paymentNote = paymentNote;
    }

    public String getShippingNote() {
        return shippingNote;
    }

    public void setShippingNote(String shippingNote) {
        this.shippingNote = shippingNote;
    }

    public PaymentType getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(PaymentType paymentType) {
        this.paymentType = paymentType;
    }

    public ShippingType getShippingType() {
        return shippingType;
    }

    public void setShippingType(ShippingType shippingType) {
        this.shippingType = shippingType;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    //orderItemSet's accessor
    public Set<OrderItem> getOrderItemSet() {
        //return new HashSet<>(orderItemSet);
        return Collections.unmodifiableSet(orderItemSet);
    }
    //orderItemSet's mutators

    public void addOrderItem(OrderItem item) {
        //get order_items from database
        this.orderItemSet.add(item);
    }

    public void addCart(ShoppingCart cart) {
        //put a cartitem from cart
        if (cart != null && cart.size() > 0) {
            //cartitem是集合
            for (CartItem cartitem : cart.getCartItemSet()) {
                OrderItem orderItem = new OrderItem();
                orderItem.setProduct(cartitem.getProduct());
                orderItem.setSize(cartitem.getSize());
                orderItem.setPrice(cart.getPrice(cartitem));
                orderItem.setQuantity(cart.getQuantity(cartitem));
                this.orderItemSet.add(orderItem);
            }
        } else {
            throw new IllegalArgumentException("結帳時購物車必須有購物明細");

        }
    }
    private double totalAmount;

    public double getTotalAmount() {
        if (orderItemSet != null && orderItemSet.size() > 0) {
            double sum = 0;
            for (OrderItem item : orderItemSet) {
                sum += item.getPrice() * item.getQuantity();
            }
            return sum;
        } else {
            return totalAmount;
        }
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

}
