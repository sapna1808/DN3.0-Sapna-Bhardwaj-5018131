package Ex1;

import java.util.HashMap;

public class Inventory {
    private HashMap<String, Product> products;

    public Inventory() {
        this.products = new HashMap<>();
    }

    public void addProduct(Product product) {
        products.put(product.getProductId(), product);
        System.out.println("Added: " + product);
    }

    public void updateProduct(String productId, Product updatedProduct) {
        if (products.containsKey(productId)) {
            products.put(productId, updatedProduct);
            System.out.println("Updated: " + updatedProduct);
        } else {
            System.out.println("Product ID " + productId + " not found.");
        }
    }

    public void deleteProduct(String productId) {
        Product removedProduct = products.remove(productId);
        if (removedProduct != null) {
            System.out.println("Deleted: " + removedProduct);
        } else {
            System.out.println("Product ID " + productId + " not found.");
        }
    }

    public Product getProduct(String productId) {
        return products.get(productId);
    }
}
