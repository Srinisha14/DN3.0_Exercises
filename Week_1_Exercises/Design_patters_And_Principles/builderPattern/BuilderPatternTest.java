package builderPattern;

//BuilderPatternTest.java
public class BuilderPatternTest {
 public static void main(String[] args) {
     // Creating different configurations of Computer using the Builder pattern
     Computer gamingPC = new Computer.Builder("Intel i9", "32GB")
                             .setStorage("1TB SSD")
                             .setGraphicsCard("NVIDIA RTX 3080")
                             .setPowerSupply("750W")
                             .setCoolingSystem("Liquid Cooling")
                             .build();

     Computer officePC = new Computer.Builder("Intel i5", "16GB")
                            .setStorage("512GB SSD")
                            .setPowerSupply("500W")
                            .build();

     Computer budgetPC = new Computer.Builder("AMD Ryzen 3", "8GB")
                           .setStorage("256GB SSD")
                           .build();

     // Print the configurations
     System.out.println(gamingPC);
     System.out.println(officePC);
     System.out.println(budgetPC);
 }
}

