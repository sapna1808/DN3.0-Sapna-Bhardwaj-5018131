package FinancialForecasting;

public class Main {
    public static void main(String[] args) {
        FinancialForecast forecast = new FinancialForecast();
        double currentValue = 10000;
        double growthRate = 0.05; // 5%
        int years = 10;

        double futureValue = forecast.forecastValue(currentValue, growthRate, years);
        System.out.println("Future Value after " + years + " years: " + futureValue);
    }
}
