public class TripManager {
    
    public static List<Trip__c> getByIds (Set<Id> tripIds) {        
        List<Trip__c> trips = [
            SELECT Name,
            		Minimum_Age__c,
            		Start_Date__c,
            		End_Date__c
            FROM Trip__c 
            WHERE Id IN : tripIds];
        return trips;
    }
    
    public static Integer getNumberSeats (Id tripId) {        
        List<Trip__c> trips = [
            SELECT Id,
            	Seats__c            		
            FROM Trip__c 
            WHERE Id  =: tripId];
        Integer NumberSeats = trips[0].Seats__c.intValue();
        return NumberSeats;
    }
    
    public static Date getStartDate (Id tripId) {        
        List<Trip__c> trips = [
            SELECT Id,
            	Start_Date__c            		
            FROM Trip__c 
            WHERE Id  =: tripId];
        Date startDate = trips[0].Start_Date__c;
        return startDate;
    }
}