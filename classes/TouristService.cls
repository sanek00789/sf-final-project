public without sharing class TouristService {
    
    public static void markDuplicates(List<Tourist__c> newTourists) {          
        if (newTourists == null || newTourists.isEmpty()) return;
        Set<String> names =  new Set<String> ();
        Set<String> emails = new Set<String> ();
        
        for (Tourist__c tour : newTourists) {
            names.add(tour.Name);
            emails.add(tour.Email__c);
        }        
        List<Tourist__c> recordsTourists = TouristManager.getByNamesAndEmails(names, emails);
        if (!recordsTourists.isEmpty()) {
            
            for (Tourist__c newTourist : newTourists) {
                
                for (Tourist__c tourist : recordsTourists) {
                    Boolean isSameName = (tourist.Name == newTourist.Name);
                    Boolean isSameEmail = (tourist.Email__c == newTourist.Email__c);
                    if (isSameName && isSameEmail) {
                        newTourist.IsDuplicate__c = true;                        
                    } 
                }
            } 
        } 
    }
    
    @future
    public static void markDuplicates(Set<Id> touristIds) {          
        if (touristIds == null || touristIds.isEmpty()) return;
        List<Tourist__c> newTourists = TouristManager.getByIds(touristIds);
        Set<String> names =  new Set<String> ();
        Set<String> emails = new Set<String> ();
        
        for (Tourist__c tour : newTourists) {
            names.add(tour.Name);
            emails.add(tour.Email__c);
        }        
        List<Tourist__c> recordsTourists = TouristManager.getByNamesAndEmails(names, emails);        
        if (!recordsTourists.isEmpty()) {
            
            for (Tourist__c newTourist : newTourists) {
                
                for (Tourist__c tourist : recordsTourists) {
                    Boolean isDifferentIds = (tourist.Id != newTourist.Id);
                    Boolean isSameName = (tourist.Name == newTourist.Name);
                    Boolean isSameEmail = (tourist.Email__c == newTourist.Email__c);
                    if (isSameName && isSameEmail && isDifferentIds) {
                        newTourist.IsDuplicate__c = true;
                    } 
                }
            }
            update newTourists;
        }
    }
    
    public static void createFlights(List<Id> touristIds, Id tripId) {          
        List<Flight__c> newFlights = new List<Flight__c>();
        for(Id touristId :touristIds) {
            Flight__c newFlight = new Flight__c ();            
            newFlight.Trip__c = tripId;            
            newFlight.Tourist__c = touristId;
            newFlight.Status__c = Constans.FLIGHT_STATUS_OFFER_PENDING;           
            newFlights.add(newFlight);
        }
        insert newFlights;
    }   
}