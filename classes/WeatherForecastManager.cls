public class WeatherForecastManager {
        
    public static List<Weather_Daily_Forecast__c> getIds() {
        List<Weather_Daily_Forecast__c> ids = [
            SELECT Id 
            FROM Weather_Daily_Forecast__c
        ];        
        return ids;		
    }
    
}