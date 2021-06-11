public class FlightTriggerHandler {       
    
    public static void onBeforeInsert (List<Flight__c> newFlights) {        
        Set<Id> tripIds = new Set<Id>();
        Set<Id> touristIds = new Set<Id>();        
        
        for (Flight__c  flight : newFlights) {
            tripIds.add(flight.Trip__c);
            touristIds.add(flight.Tourist__c);            
        }  
        List<Tourist__c> tourists = TouristManager.getByIds(touristIds);
        Map<Id, Tourist__c> touristsMap = new Map<Id, Tourist__c> (tourists);
        
        List<Trip__c> trips = TripManager.getByIds(tripIds);
        Map<Id, Trip__c> tripsMap = new Map<Id, Trip__c> (trips);
        
        for (Flight__c flight : newFlights) {
            Tourist__c tourist = touristsMap.get(flight.Tourist__c);
            Trip__c trip = tripsMap.get(flight.Trip__c);    
            if (tourist.Age__c < trip.Minimum_Age__c) {
                flight.addError(Constans.ERROR_MIN_AGE);
            }
            if (flight.Status__c == Constans.FLIGHT_STATUS_PAST || date.today() > trip.Start_Date__c) {
                flight.addError(Constans.ERROR_FLIGHT_STATUS);
                flight.Status__c.addError(Constans.ERROR_FLIGHT_STATUS);
            }
        }                        
    }                    
}