@isTest
public class TouristRestServiceTest {
    
    @TestSetup
    static void setup() {
    TestDataFactory.touristsData(3);
    }
    
    @IsTest
    private static void testGetTouristsByFuzzynameAndAge() {
        List<Tourist__c> tourists = [SELECT Name, Age__c FROM Tourist__c];        
        String fuzzyname = tourists[0].Name;
        String age = String.valueOf(tourists[0].Age__c);        
        RestContext.request = new RestRequest();
        RestContext.response = new RestResponse();      
        RestContext.request.addParameter('fuzzyname', fuzzyname);
        RestContext.request.addParameter('age', age);      
        
        	TouristRestService.getTourists();        
        
        System.assertEquals(Constans.STATUS_CODE_200 , RestContext.response.statusCode);        
    }   
    
    @IsTest
    private static void testGetTouristsByFuzzyname() {
        List<Tourist__c> tourists = [SELECT Name, Age__c FROM Tourist__c];        
        String fuzzyname = tourists[0].Name;
        RestContext.request = new RestRequest();
        RestContext.response = new RestResponse();      
        RestContext.request.addParameter('fuzzyname', fuzzyname);
                      
        TouristRestService.getTourists();        
        
        System.assertEquals(Constans.STATUS_CODE_200 , RestContext.response.statusCode);        
    }
    
    @IsTest
    private static void testValidationTourists() {
        List<Tourist__c> tourists = [SELECT Name, Age__c FROM Tourist__c];        
        String age = String.valueOf(tourists[0].Age__c);        
        RestContext.request = new RestRequest();
        RestContext.response = new RestResponse();      
        RestContext.request.addParameter('age', age);              
        
        TouristRestService.getTourists();        
        
        System.assertEquals(Constans.STATUS_CODE_404, RestContext.response.statusCode);
		System.assertEquals(Constans.THE_NAME_MUST_BE_NOT_EMPRY, RestContext.response.responseBody.toString());        
    }
    
    @IsTest
    private static void testValidationAge() {
        List<Tourist__c> tourists = [SELECT Name, Age__c FROM Tourist__c];        
        String fuzzyname = tourists[0].Name;  
        RestContext.request = new RestRequest();
        RestContext.response = new RestResponse();      
        RestContext.request.addParameter('fuzzyname', fuzzyname);
        RestContext.request.addParameter('age', 'age');       
       
        TouristRestService.getTourists();
        
        System.assertEquals(Constans.STATUS_CODE_404 , RestContext.response.statusCode);
        System.assertEquals(Constans.THE_AGE_MUST_BE_A_NUMBER, RestContext.response.responseBody.toString());
    }
    
    
    
    @isTest
    static void testCreateTourist() {           
        Date touristBirthdate = Date.newInstance(2010, 10, 01);
        String name = 'tourist';
        String email = 'sanek00789@mail.ru'; 
        
        TouristRestService.createTourist(name, touristBirthdate, email);
        
        List<Tourist__c> tourists = [
            SELECT Name
            FROM Tourist__c
        ];
        
        System.assert(tourists != null);
        System.assertEquals(4, tourists.size());
        System.assertEquals('tourist', tourists.get(3).Name);
    }
    
    @isTest
    static void testCreateTouristWithError() {        
        RestContext.response = new RestResponse();
        Date touristBirthdate = Date.newInstance(2010, 10, 01);
        String name = 'tourist 1';
        String email = 'sanek00789@mail.ru'; 
        
        TouristRestService.createTourist(name, touristBirthdate, email);
        
        List<Tourist__c> tourists = [
            SELECT Id
            FROM Tourist__c
        ];
        
        System.assert(tourists != null);
        System.assertEquals(3, tourists.size());        
        System.assertEquals(Constans.STATUS_CODE_409, RestContext.response.StatusCode);
    }
}