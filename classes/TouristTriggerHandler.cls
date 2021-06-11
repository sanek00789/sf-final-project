public class TouristTriggerHandler {    
    public static Boolean wasExecuted = true;
    
    public static void onAfterUpdate (Map<Id, Tourist__c> touristMap) {        
        if (touristMap == null || touristMap.isEmpty()) return;                   
        Set<Id> idNewTourist = touristMap.keySet();
        List<Flight__c> flights = FlightManager.getStatus(idNewTourist);        
        List<Flight__c> flightsToUpdate = new List<Flight__c> ();
        
        for (Flight__c flight : flights) {            
            if(!flight.Tourist__r.Active__c) { 
                flight.Status__c = Constans.FLIGHT_STATUS_DECLINED;
                flightsToUpdate.add(flight);                       
            }                    
        }     
        update flightsToUpdate;            
    }
    
    public static void onBeforeInsert (List<Tourist__c> newTourists) {
        TouristService.markDuplicates(newTourists);
    }
    
    public static void onAfterInsert (Map<Id, Tourist__c> touristMap) {        
        TouristService.markDuplicates(touristMap.keyset());
    }
}