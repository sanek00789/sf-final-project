@IsTest
public class WeatherForecastServiceTest {
    
    @TestSetup
    static void setup() {
        TestDataFactory.spacePointsData(5); 
    }
    
    @IsTest
    static void testGetForecasts() {        
        List<Space_Point__c> coordinates = SpacePointManager.getLatitudeAndLongitude();
        Test.setMock(HttpCalloutMock.class, new WeatherForecastServiceMock());
        
        Test.startTest();
        Map<Date, Double> dateAndTemperature = WeatherForecastService.getForecasts(coordinates.get(0).Latitude__c, coordinates.get(0).Longitude__c);
        Test.stopTest();
        
        System.assertEquals(1, dateAndTemperature.size());
        System.assertEquals(7.8, dateAndTemperature.get(Date.valueOf(String.valueOf('2021-05-12'))));
    }
    
    @IsTest
    static void testGetForecastsWithException() {        
        List<Space_Point__c> coordinates = SpacePointManager.getLatitudeAndLongitude();
        Test.setMock(HttpCalloutMock.class, new WeatherForecastServiceWithExceptionMock());       
        
        Test.startTest();
        try{	
            Map<Date, Double> dateAndTemperature = WeatherForecastService.getForecasts(coordinates.get(0).Latitude__c, coordinates.get(0).Longitude__c);
            
        } catch (WeatherForecastService.WeatherForecastException wfe) {
            System.assertEquals(Constans.ERROR_RECEIVING_REQUEST, wfe.getMessage());
        }        
        Test.stopTest();        
    }
    
    @IsTest
    private static void testInsertForecasts() {        
        Test.setMock(HttpCalloutMock.class, new WeatherForecastServiceMock());        
        
        Test.startTest();
        	WeatherForecastUpdater.updateForecasts();
        Test.stopTest();
        
        List<Weather_Daily_Forecast__c> forecasts = [
            SELECT Id
            FROM Weather_Daily_Forecast__c           
        ];
        System.debug(forecasts);
        System.assertEquals(5, forecasts.size());        
    }
}