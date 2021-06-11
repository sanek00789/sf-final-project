@isTest
public class TouristTriggerHandlerTest {
    
    @testSetup
    static void setup() {
        TestDataFactory.flightsData(2);
        
    }
    
    @isTest
    static void testOnAfterUpdate() {        
        List<Tourist__c> newTourist = [
            SELECT Active__c 
            FROM Tourist__c
        ];
        newTourist.get(0).Active__c = false;
        update newTourist;        
        Map<Id, Tourist__c> newTouristMap = new Map<Id, Tourist__c>(newTourist);
        TouristTriggerHandler.onAfterUpdate(newTouristMap);
        List<Flight__c> flights = [
            SELECT Status__c 
            FROM Flight__c 
            WHERE Status__c = 'Declined'
        ];
        System.assertEquals(1, flights.size());        
    }
    
     @isTest
    static void testOnAfterInsert() {
        List<Tourist__c> newTourists = [
            SELECT Id 
            FROM Tourist__c
        ];
        
        Map<Id, Tourist__c> newTouristsMap = new Map<Id, Tourist__c>(newTourists);
        TouristTriggerHandler.onAfterInsert(newTouristsMap);                
    }
}