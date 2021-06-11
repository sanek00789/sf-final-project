@isTest
public class TripManagerTest {
    @isTest
    static void testGetByIds() {
        List<Trip__c> newTrips = new List<Trip__c> {
            new Trip__c(Name = 'Moskow', Minimum_Age__c = 15, Start_Date__c = date.newInstance (2021, 12, 15)),
            new Trip__c(Name = 'Minsk', Minimum_Age__c = 21, Start_Date__c = date.newInstance (2021, 08, 13))
        };
        insert newTrips;
        Set<Id> tripIds = new Set<Id>();
        List<Trip__c> trips = [
            SELECT Id 
            FROM Trip__c
        ];
        
        for(Trip__c trip :trips) {
            tripIds.add(trip.Id);
        }
        List<Trip__c> tripWithIds = TripManager.getByIds(tripIds);
        System.assert(tripWithIds != null);
    } 
}