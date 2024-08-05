package SortingCustomerOrders;

public class Main {
    public static void main(String[] args) {
        Order[] orders = {
            new Order("001", "Alice", 500.00),
            new Order("002", "Bob", 1500.00),
            new Order("003", "Charlie", 700.00),
            new Order("004", "David", 1200.00)
        };

        Sorting sorting = new Sorting();

        // Bubble Sort
        sorting.bubbleSort(orders);
        System.out.println("Orders sorted by Bubble Sort:");
        for (Order order : orders) {
            System.out.println(order);
        }

        // Quick Sort
        sorting.quickSort(orders, 0, orders.length - 1);
        System.out.println("Orders sorted by Quick Sort:");
        for (Order order : orders) {
            System.out.println(order);
        }
    }
}
