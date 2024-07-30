package customerordersorter;

// Main.java

public class Main {
    public static void main(String[] args) {
        // Create customers
        Customer customer1 = new Customer("John Doe", "john.doe@example.com");
        Customer customer2 = new Customer("Jane Doe", "jane.doe@example.com");
        Customer customer3 = new Customer("Bob Smith", "bob.smith@example.com");

        // Create orders
        order order1 = new order(1, customer1, 100.0);
        order order2 = new order(2, customer2, 50.0);
        order order3 = new order(3, customer3, 200.0);

        // Create order array
        order[] orders = {order1, order2, order3};

        // Sort orders using Bubble Sort
        bubblesort.sortOrders(orders);
        System.out.println("Bubble Sort:");
        printOrders(orders);

        // Sort orders using Quick Sort
        Quicksort.sortOrders(orders);
        System.out.println("Quick Sort:");
        printOrders(orders);
    }

    private static void printOrders(order[] orders) {
        for (order order : orders) {
            System.out.println("Order ID: " + order.getOrderId() + ", Customer: " + order.getCustomer().getName() + ", Total Price: " + order.getTotalPrice());
        }
    }
}
