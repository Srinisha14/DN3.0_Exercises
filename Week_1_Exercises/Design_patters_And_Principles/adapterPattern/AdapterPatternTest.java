package adapterPattern;

//AdapterPatternTest.java
public class AdapterPatternTest {
 public static void main(String[] args) {
     // Using PayPal
     PaymentProcessor payPalProcessor = new PayPalAdapter(new PayPal());
     payPalProcessor.processPayment(100.0);

     // Using Stripe
     PaymentProcessor stripeProcessor = new StripeAdapter(new Stripe());
     stripeProcessor.processPayment(200.0);

     // Using Square
     PaymentProcessor squareProcessor = new SquareAdapter(new Square());
     squareProcessor.processPayment(300.0);
 }
}
