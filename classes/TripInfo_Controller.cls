public class TripInfo_Controller {
    
    public Trip__c trip;
    public List<Tourist__c> notRelatedTourist {get;set;}
    
    public TripInfo_Controller(ApexPages.StandardController stdController) {
        this.trip = (Trip__c)stdController.getRecord();
        this.notRelatedTourist = TouristManager.getNotRelatedTourist(trip.Id);
    }   
}