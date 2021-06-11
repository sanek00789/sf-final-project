@isTest
public class FlightTriggerHandlerTest {
    
    @isTest
    static void testOnBeforeInsertValidationAge() {
        Trip__c newTrip = new Trip__c(
            Name = 'trip', 
            Minimum_Age__c = 15, 
            Start_Date__c = date.newInstance (2021, 12, 15)
        );
        insert newTrip;
        
        Tourist__c newTourist = new Tourist__c(
            Name = 'tourist', 
            Birthdate__c = date.newInstance (2015, 12, 15), 
            Email__c = 'sanek00789@mail.ru'
        );
        insert newTourist;
        
        Flight__c newFlight = new Flight__c(
            Tourist__c = newTourist.Id,
            Trip__c = newTrip.Id
        );        
        Database.SaveResult result = Database.insert(newFlight, false);
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('Insufficient minimum age', result.getErrors()[0].getMessage());  
    }
    
    @isTest
    static void testOnBeforeInsertValidationStatus() {
        Trip__c newTrip = new Trip__c(
            Name = 'trip', 
            Minimum_Age__c = 1, 
            Start_Date__c = date.newInstance (2021, 12, 15)
        );
        insert newTrip;
        
        Tourist__c newTourist = new Tourist__c(
            Name = 'tourist', 
            Birthdate__c = date.newInstance (2015, 12, 15), 
            Email__c = 'sanek00789@mail.ru'
        );
        insert newTourist;
        
        Flight__c newFlight = new Flight__c(
            Tourist__c = newTourist.Id,
            Trip__c = newTrip.Id,
            Status__c = 'Past'
        );        
        Database.SaveResult result = Database.insert(newFlight, false);
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('The flight has already departed', result.getErrors()[0].getMessage());  
    }    
}