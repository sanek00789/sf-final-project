public inherited sharing class RegTouristsForTripController {
    
    @AuraEnabled(cacheable = true)
    public static List <Tourist__c> getSuitableForTrip(Id tripId) {
        if(tripId == null) {
            throw new AuraHandledException(Constans.GENERAL_ERROR);
        }        
        List <Tourist__c> result = TouristManager.getSuitableForTrip(tripId);
        return result;
    } 
    
    @AuraEnabled
    public static void createFlights(List<Id> touristIds, Id tripId) {
        if(touristIds == null || touristIds.isEmpty() || tripId == null) {
            throw new AuraHandledException(Constans.GENERAL_ERROR);
        }
        TouristService.createFlights(touristIds, tripId);
    }  
}