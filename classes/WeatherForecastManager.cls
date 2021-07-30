public class WeatherForecastManager {
        
    public static List<Weather_Daily_Forecast__c> getIds() {
        List<Weather_Daily_Forecast__c> ids = [
            SELECT Id 
            FROM Weather_Daily_Forecast__c
        ];        
        return ids;		
    }
    
    public static Weather_Daily_Forecast__c getAverageTemperature(Id spacePoint) {
        Weather_Daily_Forecast__c result = [
            SELECT Id,
            Average_Temperature__c
            FROM Weather_Daily_Forecast__c
            WHERE Date__c = TODAY
            AND Space_Point__c = :spacePoint
        ];
        return result;
    }
    
}