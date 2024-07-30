package singletonPattern;

//Logger.java
public class Logger {
 // Private static variable of the same class that is the only instance of the class
 private static Logger instance;

 // Private constructor to prevent instantiation
 private Logger() {
     // Initialize logging resources if needed
     System.out.println("Logger initialized.");
 }

 // Public static method to provide access to the instance
 public static synchronized Logger getInstance() {
     if (instance == null) {
         instance = new Logger();
     }
     return instance;
 }

 // Example method for logging messages
 public void log(String message) {
     System.out.println("Log message: " + message);
 }
}
