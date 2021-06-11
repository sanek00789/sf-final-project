@isTest
public class FlightManagerTest {
    
    @testSetup
    static void setup() {
       List<Flight__c> newflights = TestDataFactory.flightsData(3);
    }
    
    @isTest
    static void testGetStatus() {
        Set<Id> touristIds = new Set<Id>();
        List<Flight__c> flights = [
            SELECT Id, 
            Tourist__c 
            FROM Flight__c
        ];        
        
        for(Flight__c flight :flights) {
            touristIds.add(flight.Tourist__c);
        }        
        List<Flight__c> getStatus = FlightManager.getStatus(touristIds);        
        System.assertEquals(3, getStatus.size());
    } 
}