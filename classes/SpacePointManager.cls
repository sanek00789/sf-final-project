public class SpacePointManager {
    
    public static List<Space_Point__c> getLatitudeAndLongitude() {
        List<Space_Point__c> spasePoints = [
            SELECT City__c,
            		Latitude__c, 
            		Longitude__c 
            FROM Space_Point__c
        ];        
        return spasePoints;		
    }
    
    public static List<Space_Point__c> getCityAndCountry(Id spacePointId) {
        List<Space_Point__c> spasePoint = [
            SELECT City__c,
            		Country__c
            FROM Space_Point__c
            WHERE Id =: spacePointId            
        ];        
        return spasePoint;		
    }

}