package org.digital.nurture;

public class MainApp {
    public static void main(String[] args) {
        // Main application code to demonstrate the Decorator Pattern
        Notifier emailNotifier = new EmailNotifier();
        Notifier smsNotifier = new SMSNotifierDecorator(emailNotifier);
        Notifier slackNotifier = new SlackNotifierDecorator(smsNotifier);
        slackNotifier.send("Hello, Decorator Pattern!");
    }
}