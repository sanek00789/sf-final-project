@isTest
public class TouristServiceTest {
    
    @testSetup
    static void setup() {
        TestDataFactory.touristsData(2);
    }
    
    @isTest
    static void testMarkDuplicates() {
        List<Tourist__c> newTourist = new List<Tourist__c> {
            new Tourist__c(
            				Name = 'tourist 1', 
            				Birthdate__c = date.newInstance (1989, 12, 15),
            				Email__c = 'sanek00789@mail.ru'), 
            new Tourist__c(
            				Name = 'tourist', 
            				Birthdate__c = date.newInstance (1989, 12, 15),
            				Email__c = 'sanek@mail.ru')
        };
        insert newTourist;        
        List<Tourist__c> dublicateTourist = [
            SELECT IsDuplicate__c
            FROM Tourist__c
            WHERE IsDuplicate__c = true
        ];
        System.assertEquals(1, dublicateTourist.size());
    }
    
    @isTest
    static void testMarkDuplicatesFuture() {        
        List<Tourist__c> newTourist = new List<Tourist__c> {
            new Tourist__c(
            				Name = 'tourist 1', 
            				Birthdate__c = date.newInstance (1989, 12, 15),
            				Email__c = 'sanek00789@mail.ru'), 
            new Tourist__c(
            				Name = 'tourist', 
            				Birthdate__c = date.newInstance (1989, 12, 15),
            				Email__c = 'sanek@mail.ru')
        };
        insert newTourist;        
        Map<Id, Tourist__c> newtouristsMap = new Map<Id, Tourist__c> (newTourist);
        
        Test.startTest ();
		TouristService.markDuplicates(newtouristsMap.keyset());
		Test.stopTest ();
        
        List<Tourist__c> dublicateTourist = [
            SELECT IsDuplicate__c
            FROM Tourist__c
            WHERE IsDuplicate__c = true
        ];
        System.assertEquals(1, dublicateTourist.size());
    }
}