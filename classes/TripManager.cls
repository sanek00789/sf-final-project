public class TripManager {
    
    public static List<Trip__c> getByIds (Set<Id> tripIds) {        
        List<Trip__c> trips = [
            SELECT Name,
            		Minimum_Age__c,
            		Start_Date__c,
            		End_Date__c,
            		Seats__c
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
    
    public static List<Trip__c> getById(Id touristId) {
        if(touristId == null) {
            return new List<Trip__c> ();
        }
        List<Trip__c> result = [
            SELECT Id,
                	Name,
            		Minimum_Age__c,
            		Start_Date__c,            		
            		Seats__c,
            		End_Date__c,
            		Departure_Space_Point__c
            FROM Trip__c
            WHERE Id NOT IN (
                SELECT Trip__c 
                FROM Flight__c 
                WHERE Tourist__c = :touristId)            
        ];                
        return result;
    }
    
    public static List<Trip__c> getName (Id tripId) {        
        List<Trip__c> trips = [
            SELECT Id,
            	Name            		
            FROM Trip__c 
            WHERE Id  =: tripId];        
        return trips;
    }
    
    public static List<Trip__c> getSpacePoint (Id tripId) {        
        List<Trip__c> trips = [
            SELECT Id,
            	Departure_Space_Point__c            		
            FROM Trip__c 
            WHERE Id  =: tripId];        
        return trips;
    }
    
    public static List<Trip__c> getSuitableTrips(Id touristId) { 
        if (touristId == null) {
            return new List<Trip__c>();
        }
        Tourist__c tourist = TouristManager.getByIds(new Set<Id>{touristId})[0];
        List<Trip__c> trips = [
            SELECT Id,
                	Name,
            		Minimum_Age__c,
            		Start_Date__c,            		
            		Seats__c,
            		End_Date__c,
            		Departure_Space_Point__c    
            FROM Trip__c
            WHERE Id NOT IN (
                SELECT Trip__c 
                FROM Flight__c 
                WHERE Tourist__c = :tourist.Id) 
                AND
                    Minimum_Age__c <= :tourist.Age__c
                AND 
                    Start_Date__c >= :Date.today()
        ];     
        return trips;
    }
}