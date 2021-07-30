public class FlightManager {
    
    public static List<Flight__c> getStatus (Set<Id> idTourists) {
        List<Flight__c> flights = [
            SELECT Tourist__c, 
            		Tourist__r.Active__c, 
            		Status__c 
            FROM Flight__c 
            WHERE Tourist__c IN : idTourists];
        return flights;        
    }
    
    public static Integer getNumberOfRegisteredTourists (Id tripId) {
        List<Flight__c> flights = [
            SELECT Tourist__c             		
            FROM Flight__c 
            WHERE Trip__c =: tripId
        ];
        return flights.size();        
    }
    
    public static List<Flight__c> getTrips (Id touristId) {
        List<Flight__c> flights = [
            SELECT Trip__c
            FROM Flight__c 
            WHERE Tourist__c !=: touristId];
        return flights;        
    }
}