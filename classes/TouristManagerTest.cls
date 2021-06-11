@isTest
public class TouristManagerTest {
    
    @testSetup
    static void setup() {
        List<Tourist__c> newtourists = TestDataFactory.touristsData(2);
        List<Flight__c> newtrips = TestDataFactory.flightsData(2);
    }
     
    @isTest
    static void testGetByName() {
        List<Tourist__c> tourists = TouristManager.getByName('Alex');
        System.assert(tourists != null);
    }
    
    @isTest
    static void testGetByAge() {
        List<Tourist__c> tourists = TouristManager.getByAge(15);
        System.assert(tourists != null);
    }
    
    @isTest
    static void testGetByStartYear() {
        List<Flight__c> flights = TouristManager.getByStartYear(1989);        
        System.assert(flights != null);
    }
    
    @isTest
    static void testGetWithFlights() {
        TouristManager.getWithFlights();        
    }
    
    @isTest
    static void testGetWithoutFlights() {
        TouristManager.getWithoutFlights();        
    }
    
    @isTest
    static void testGetByNamesAndEmails() {
        Set<String> names = new Set<String>(); 
        Set<String> emails = new Set<String>();
        List<Tourist__c> tourists = TouristManager.getByNamesAndEmails(names, emails);
        System.assert(tourists != null);
    }
    
    @isTest
    static void testGetActive() {        
        List<Tourist__c> tourists = TouristManager.getActive();
        System.assert(tourists != null);
    }
    
    @isTest
    static void testGetByIds() {
        Set<Id> touristIds = new Set<Id>();        
        List<Tourist__c> tourists = TouristManager.getByIds(touristIds);
        System.assert(tourists != null);
    }
    
    @isTest
    static void testGetByNameAndEmail() {                
        List<Tourist__c> tourists = TouristManager.getByNameAndEmail('name', 'email');
        System.assert(tourists != null);
    }
    
    @isTest
    static void testGetByFuzzynameAndAge() {                
        List<Tourist__c> tourists = TouristManager.getByFuzzynameAndAge('fuzzyname', 1989);
        System.assert(tourists != null);
    }
    
    @isTest
    static void testGetByFuzzyname() {                
        List<Tourist__c> tourists = TouristManager.getByFuzzyname('fuzzyname');
        System.assert(tourists != null);
    }
}