package ECommercePlatform;

import java.util.*;

public class Main {
    public static void main(String[] args) {
        Product[] products = {
            new Product("101", "Laptop", "Electronics"),
            new Product("102", "Smartphone", "Electronics"),
            new Product("103", "Tablet", "Electronics"),
            new Product("104", "Headphones", "Accessories")
        };

        Search search = new Search();

        // Linear Search
        Product foundProduct = search.linearSearch(products, "102");
        System.out.println("Linear Search: Found " + foundProduct);

        // Sort products by productId for Binary Search
        Arrays.sort(products, (p1, p2) -> p1.getProductId().compareTo(p2.getProductId()));

        // Binary Search
        foundProduct = search.binarySearch(products, "102");
        System.out.println("Binary Search: Found " + foundProduct);
    }
}
