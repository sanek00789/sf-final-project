@isTest
public class WeatherForecastUpdaterTest {
    
    @isTest
    static void testUpdateForecasts() {
        TestDataFactory.forecastsData(2);
        TestDataFactory.spacePointsData(2);
        
        Test.startTest();
		WeatherForecastUpdater.updateForecasts();        
        Test.stopTest ();
        
        List<Weather_Daily_Forecast__c> forecasts = [
            SELECT Id
            FROM Weather_Daily_Forecast__c           
        ];
        System.assertEquals(16, forecasts.size());
        
    }

}