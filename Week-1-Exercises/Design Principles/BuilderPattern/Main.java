import java.util.*;

class Computer{
    private final String CPU;
    private final String RAM;
    private final String storage;
    private final String GPU;

    private Computer(Builder builder){
        this.CPU = builder.CPU;
        this.RAM = builder.RAM;
        this.storage = builder.storage;
        this.GPU = builder.GPU;
    }

    public String getCPU() {
        return CPU;
    }

    public String getRAM() {
        return RAM;
    }
    public String getStorage() {
        return storage;
    }
    public String getGPU() {
        return GPU;
    }
    public static class Builder{
        private final String CPU;
        private final String RAM;
        private final String storage;
        // Optional attributes
        private String GPU;

        // Constructor for required attributes
        public Builder(String CPU, String RAM, String storage) {
            this.CPU = CPU;
            this.RAM = RAM;
            this.storage = storage;
        }

        // Methods to set optional attributes
        public Builder setGPU(String GPU) {
            this.GPU = GPU;
            return this;
        }

        // Build method to create a Computer object
        public Computer build() {
            return new Computer(this);
        }
    }
}
public class Main {
    public static void main(String[] args) {
        // Creating different configurations of Computer using Builder pattern
        Computer gamingPC = new Computer.Builder("Intel i9", "32GB", "1TB SSD")
                .setGPU("NVIDIA RTX 3080")
                .build();

        Computer officePC = new Computer.Builder("Intel i5", "16GB", "512GB SSD")
                .build();

        // Displaying the configurations
        System.out.println("Gaming PC Configuration:");
        System.out.println("CPU: " + gamingPC.getCPU());
        System.out.println("RAM: " + gamingPC.getRAM());
        System.out.println("Storage: " + gamingPC.getStorage());
        System.out.println("GPU: " + gamingPC.getGPU());

        System.out.println("\nOffice PC Configuration:");
        System.out.println("CPU: " + officePC.getCPU());
        System.out.println("RAM: " + officePC.getRAM());
        System.out.println("Storage: " + officePC.getStorage());
        System.out.println("GPU: " + officePC.getGPU()); // This will be null since GPU is optional
    }
}