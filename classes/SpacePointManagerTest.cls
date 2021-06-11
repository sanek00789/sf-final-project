@isTest
public class SpacePointManagerTest {
    @isTest
    static void TestGetLatitudeAndLongitude() {
        TestDataFactory.spacePointsData(5);        
        List<Space_Point__c> spasePoints = SpacePointManager.getLatitudeAndLongitude();        
        System.assertEquals(5, spasePoints.size());
    }
}