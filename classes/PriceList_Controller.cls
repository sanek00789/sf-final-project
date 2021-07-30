public without sharing class PriceList_Controller {
    
    public List<Trip__c> trips {get;set;}
	public List<PricebookEntry> prices {get;set;}
    
    public PriceList_Controller(ApexPages.StandardController stdController) {        
        Id touristId = ApexPages.CurrentPage().getparameters().get('id');
        this.trips = TouristAssignmentController.getTripsById(touristid);
        Map<Id, Trip__c> tripsMap = new Map<Id, Trip__c>(trips);
        this.prices = PriceBookEntryManager.getTripByIds(tripsMap.keySet());        
    }
}