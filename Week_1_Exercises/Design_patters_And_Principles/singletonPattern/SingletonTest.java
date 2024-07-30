package singletonPattern;

//SingletonTest.java
public class SingletonTest {
 public static void main(String[] args) {
     // Get the only instance of Logger
     Logger logger1 = Logger.getInstance();
     Logger logger2 = Logger.getInstance();

     // Log messages
     logger1.log("This is the first log message.");
     logger2.log("This is the second log message.");

     // Verify if both instances are the same
     System.out.println("Are both Logger instances the same? " + (logger1 == logger2));
 }
}
