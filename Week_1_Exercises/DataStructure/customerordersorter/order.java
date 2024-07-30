package customerordersorter;


// Order.java

public class order {
    private int orderId;
    private Customer customer;
    private double totalPrice;

    public order(int orderId, Customer customer, double totalPrice) {
        this.orderId = orderId;
        this.customer = customer;
        this.totalPrice = totalPrice;
    }

    public int getOrderId() {
        return orderId;
    }

    public Customer getCustomer() {
        return customer;
    }

    public double getTotalPrice() {
        return totalPrice;
    }
}