package FinancialForecasting;

public class FinancialForecast {
    public double forecastValue(double currentValue, double growthRate, int years) {
        if (years == 0) {
            return currentValue;
        }
        return (1 + growthRate) * forecastValue(currentValue, growthRate, years - 1);
    }
}
