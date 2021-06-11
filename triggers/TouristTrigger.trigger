trigger TouristTrigger on Tourist__c (before insert, after update, after insert) {
    if (TouristTriggerHandler.wasExecuted) {
        TouristTriggerHandler.wasExecuted = false;
        
        switch on Trigger.operationType {
            when BEFORE_INSERT {
                TouristTriggerHandler.onBeforeInsert(Trigger.new);
            }
            when AFTER_UPDATE {
                TouristTriggerHandler.onAfterUpdate(Trigger.newMap);
            }
            when AFTER_INSERT {
                TouristTriggerHandler.onAfterInsert(Trigger.newMap);
            } 
        }	
    }    
}