@isTest
public class WeatherForecastManagerTest {
    
    @isTest
    static void testGetIds() {
        TestDataFactory.forecastsData(2);
        List<Weather_Daily_Forecast__c> forecasts = WeatherForecastManager.getIds();
        System.debug(forecasts);
        System.assertEquals(2, forecasts.size());      
    }
}