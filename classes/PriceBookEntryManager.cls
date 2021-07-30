public without sharing class PriceBookEntryManager {
    
    public static final String Trip_Price_Book = 'Trip Price Book';
    
    public static List<PricebookEntry> getTripByIds(Set<Id> tripIds) {
        if(tripIds == null) {
            return new List<PricebookEntry> ();
        }
        List<PricebookEntry> result = [
            SELECT UnitPrice,
                Trip__r.Name,
                Trip__r.Start_Date__c,
                Trip__r.Departure_Space_Point__r.City__c,
            	Pricebook2.Name
            FROM PricebookEntry
            WHERE Trip__c =: tripIds
            AND Pricebook2.Name =: Trip_Price_Book
        ];
        return result;
    }
}