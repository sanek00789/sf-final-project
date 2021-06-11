public with sharing class WeatherForecastUpdater {
    
    @future(callout = true)
    public static void updateForecasts() {
        List<Weather_Daily_Forecast__c> oldForecasts = WeatherForecastManager.getIds();        
        List<Space_Point__c> coordinates = SpacePointManager.getLatitudeAndLongitude();
        List<Weather_Daily_Forecast__c> weatherDailyForecast = new List<Weather_Daily_Forecast__c>();		        
        
        for(Space_Point__c coordinate : coordinates) {            
            Map<Date, Decimal> dateAndTemperature = WeatherForecastService.getForecasts(coordinate.Latitude__c, coordinate.Longitude__c);
            
            for(Date forecastDate : dateAndTemperature.keySet()) {
                Weather_Daily_Forecast__c forecast = new Weather_Daily_Forecast__c();                
                forecast.Date__c = forecastDate;
                forecast.Space_Point__c = coordinate.Id;
                forecast.Average_Temperature__c = dateAndTemperature.get(forecastDate);
                forecast.City__c = coordinate.City__c;
                weatherDailyForecast.add(forecast);
            }          
        }
        delete oldForecasts;        
        insert weatherDailyForecast;
    }
}