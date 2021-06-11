trigger FlightTrigger on Flight__c (before insert) {
    switch on Trigger.operationType {
        when BEFORE_INSERT {
            FlightTriggerHandler.onBeforeInsert(Trigger.new); 
        }    
    }
}