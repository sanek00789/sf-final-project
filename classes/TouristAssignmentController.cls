public without sharing class TouristAssignmentController {
    
    @AuraEnabled(cacheable = true)
    public static List <Trip__c> getTripsById(Id touristId) {
        List<Trip__c> trips = TripManager.getSuitableTrips(touristId);
        return trips;
    }
    
    @AuraEnabled
    public static void createFlight(Id touristId, Id tripId) {
        if(touristId == null||tripId == null) {
            throw new AuraHandledException(Constans.GENERAL_ERROR);
        }
        List<Id> touristIds = new List<Id> {touristId};
        TouristService.createFlights(touristIds, tripId);        
    }   
}