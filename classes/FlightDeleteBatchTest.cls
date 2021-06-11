@isTest
public class FlightDeleteBatchTest {
    @testSetup
    static void testSetup () {
        TestDataFactory.flightsData(3);
        List<Trip__c> trips = TestDataFactory.tripsData(5);
        List<Tourist__c> tourists = TestDataFactory.touristsData(5);
		List<Flight__c> newFlights = new List<Flight__c>();        
        
        for (Trip__c trip : trips) {
            newFlights.add(
                new Flight__c(Trip__c = trip.Id, 
                              Tourist__c = tourists.get(0).Id, 
                              Status__c = 'Declined')
            );
        }        
        insert newFlights;        
    }
    
    @isTest
    static void testFlightDeleteBatch () {
        
        Test.startTest();
        FlightDeleteBatch flightDeleteBatch = new FlightDeleteBatch();
        Database.executeBatch(flightDeleteBatch);
        Test.stopTest();
        
        List<Flight__c> flights = [SELECT Id FROM Flight__c];
        Integer beforeInvocations = Limits.getEmailInvocations();
        System.assert(flights != null);
        System.debug(flights);
        System.assertEquals(3, flights.size());
        System.assertEquals(0, beforeInvocations);
    }    
}