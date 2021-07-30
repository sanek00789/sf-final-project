public without sharing class TripDetailsController {
    
    @AuraEnabled(cacheable = true)
    public static Space_Point__c getSpacePoint(Id spacePointId) {
        if(spacePointId == null) {
            throw new AuraHandledException(Constans.GENERAL_ERROR);
        }
        Space_Point__c spacePoint = SpacePointManager.getCityAndCountry(spacePointId)[0];        
        return spacePoint;
    }
    
     @AuraEnabled(cacheable = true)
    public static Weather_Daily_Forecast__c getTemperature(Id tripId) {
        if(tripId == null) {
            throw new AuraHandledException(Constans.GENERAL_ERROR);
        }
        Trip__c trip = TripManager.getSpacePoint(tripId)[0];
        Id spacePoint = trip.Departure_Space_Point__c;
        Weather_Daily_Forecast__c temperature = WeatherForecastManager.getAverageTemperature(spacePoint);
        return temperature;
    }
}