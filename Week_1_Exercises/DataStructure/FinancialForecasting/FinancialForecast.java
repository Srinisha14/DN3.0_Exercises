package FinancialForecasting;

// FinancialForecast.java

public class FinancialForecast {
    public static double calculateFutureValue(double presentValue, double growthRate, int years) {
        if (years == 0) {
            return presentValue;
        } else {
            return calculateFutureValue(presentValue * (1 + growthRate), growthRate, years - 1);
        }
    }

    public static double predictFutureValue(double presentValue, double[] growthRates, int years) {
        if (years == 0) {
            return presentValue;
        } else {
            double growthRate = growthRates[years - 1];
            return predictFutureValue(presentValue * (1 + growthRate), growthRates, years - 1);
        }
    }
}