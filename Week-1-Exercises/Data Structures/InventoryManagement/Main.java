package Ex1;
public class Main {
    public static void main(String[] args) {
        Inventory inventory = new Inventory();

        Product p1 = new Product("101", "Laptop", 50, 999.99);
        Product p2 = new Product("102", "Smartphone", 200, 499.99);
        Product p3 = new Product("103", "Tablet", 100, 299.99);

        inventory.addProduct(p1);
        inventory.addProduct(p2);
        inventory.addProduct(p3);

        inventory.updateProduct("102", new Product("102", "Smartphone", 180, 479.99));

        inventory.deleteProduct("103");

        Product p = inventory.getProduct("101");
        System.out.println("Retrieved: " + p);
    }
}
