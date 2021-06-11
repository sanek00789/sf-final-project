@isTest
public class TestDataFactory {
    
    public static List<Trip__c> tripsData(Integer numTrips) {
        List<Trip__c> newTrips = new List<Trip__c>();
        for (Integer i = 0; i < numTrips; i++) {
            newTrips.add(
                new Trip__c(Name = 'trip ' + i, 
                            Minimum_Age__c = 15, 
                            Start_Date__c = date.newInstance (2021, 12, 15))
            );
        }
        insert newTrips;
        return newTrips;        
    }
    
    public static List<Tourist__c> touristsData(Integer numTourist) {
        List<Tourist__c> newTourists = new List<Tourist__c>();
        
        for (Integer i = 0; i < numTourist; i++) {
            newTourists.add(
                new Tourist__c(Name = 'tourist ' + i, 
                               Birthdate__c = date.newInstance (1989, 12, 15), 
                               Email__c = 'sanek00789@mail.ru')
                );
        }
        insert newTourists;
        return newTourists;        
    }
    
    public static List<Flight__c> flightsData(Integer numFlight) {        
        List<Trip__c> trips = TestDataFactory.tripsData(numFlight);
        List<Tourist__c> tourists = TestDataFactory.touristsData(numFlight);        
        List<Flight__c> newFlights = new List<Flight__c>();        
        
        for (Tourist__c tourist : tourists) {
            newFlights.add(
                new Flight__c(Trip__c = trips.get(0).Id, 
                              Tourist__c = tourist.Id, 
                              Status__c = 'Accepted')
            );            
        }        
        insert newFlights;
        return newFlights;
    }
    
    public static List<Weather_Daily_Forecast__c> forecastsData(Integer numForecasts) {
        List<Weather_Daily_Forecast__c> newforecasts = new List<Weather_Daily_Forecast__c>();
        for (Integer i = 0; i < numForecasts; i++) {
            newforecasts.add(new Weather_Daily_Forecast__c(City__c = 'City ' + i));
        }
        insert newforecasts;
        return newforecasts;        
    }
    
    public static List<Space_Point__c> spacePointsData(Integer numSpacePoint) {
        List<Space_Point__c> newSpacePoints = new List<Space_Point__c>();
        for (Integer i = 0; i < numSpacePoint; i++) {
            newSpacePoints.add(new Space_Point__c(Country__c = 'Country ' + i,
                                                 Latitude__c = i,
                                                 Longitude__c = i)
                              );
        }
        insert newSpacePoints;
        return newSpacePoints;        
    }    
}