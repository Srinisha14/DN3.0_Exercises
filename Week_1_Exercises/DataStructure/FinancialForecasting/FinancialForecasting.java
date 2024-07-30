package FinancialForecasting;
// FinancialForecasting.java

public class FinancialForecasting {
    public static void main(String[] args) {
        double presentValue = 1000.0;
        double growthRate = 0.05;
        int years = 5;

        double futureValue = FinancialForecast.calculateFutureValue(presentValue, growthRate, years);
        System.out.println("Future value after " + years + " years: " + futureValue);

        double[] growthRates = {0.03, 0.05, 0.07, 0.09, 0.11};
        futureValue = FinancialForecast.predictFutureValue(presentValue, growthRates, years);
        System.out.println("Future value after " + years + " years with varying growth rates: " + futureValue);
    }
}