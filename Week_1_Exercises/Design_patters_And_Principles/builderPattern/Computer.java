package builderPattern;

//Computer.java
public class Computer {
 // Attributes
 private String CPU;
 private String RAM;
 private String storage;
 private String graphicsCard;
 private String powerSupply;
 private String coolingSystem;

 // Private constructor that takes the Builder as a parameter
 private Computer(Builder builder) {
     this.CPU = builder.CPU;
     this.RAM = builder.RAM;
     this.storage = builder.storage;
     this.graphicsCard = builder.graphicsCard;
     this.powerSupply = builder.powerSupply;
     this.coolingSystem = builder.coolingSystem;
 }

 @Override
 public String toString() {
     return "Computer [CPU=" + CPU + ", RAM=" + RAM + ", storage=" + storage + 
            ", graphicsCard=" + graphicsCard + ", powerSupply=" + powerSupply + 
            ", coolingSystem=" + coolingSystem + "]";
 }

 // Static nested Builder class
 public static class Builder {
     // Required attributes
     private String CPU;
     private String RAM;
     
     // Optional attributes
     private String storage;
     private String graphicsCard;
     private String powerSupply;
     private String coolingSystem;

     public Builder(String CPU, String RAM) {
         this.CPU = CPU;
         this.RAM = RAM;
     }

     public Builder setStorage(String storage) {
         this.storage = storage;
         return this;
     }

     public Builder setGraphicsCard(String graphicsCard) {
         this.graphicsCard = graphicsCard;
         return this;
     }

     public Builder setPowerSupply(String powerSupply) {
         this.powerSupply = powerSupply;
         return this;
     }

     public Builder setCoolingSystem(String coolingSystem) {
         this.coolingSystem = coolingSystem;
         return this;
     }

     // Build method that returns an instance of Computer
     public Computer build() {
         return new Computer(this);
     }
 }
}
