public class FlightDeleteBatch implements Database.Batchable<sObject>, Database.Stateful {
    private Map <Id, Integer> countFlights = new Map<Id, Integer>();
    private Set<Id> flightIds = new Set<Id>();    
    private Date dateLimit = System.today() - Constans.FLIGHT_DELETION_PERIOD_DAYS;
    private String status = Constans.FLIGHT_STATUS_DECLINED;
    private final String query = 'SELECT CreatedDate, ' + 
        'Status__c, ' + 
        'Tourist__r.Name, ' +
        'Tourist__r.Id ' +
        'FROM Flight__c ' +
        'WHERE CreatedDate <=: dateLimit OR Status__c =: status';    
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(query);
    }
    
    public void execute (Database.BatchableContext bc, List<Flight__c> flightsToDelete) {        
        Map<Id, Flight__c> flightById = new Map<Id, Flight__c> (flightsToDelete);
        List<Database.DeleteResult> delResultFlights = Database.delete(flightsToDelete, false);        
        
        for (Database.DeleteResult delresultflight :delResultFlights) {
            if(delresultflight.isSuccess()) {
                Flight__c flight = flightById.get(delresultflight.getId());
                if(countFlights.containsKey(flight.Tourist__c)) {
                    Integer count = countFlights.get(flight.Tourist__c) + 1;
                    countFlights.put(flight.Tourist__c, count);
                } else {
                    countFlights.put(flight.Tourist__c, 1);
                }                
            }
        } 
    }
    
    public void finish (Database.BatchableContext bc) {
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();         
        List<Email__mdt> emails = EmailCustomMetadataTypeManager.getEmail(); 
        List<Tourist__c> tourists = TouristManager.getByIds(countFlights.keyset());
        String textEmail = '';
        
        for (Tourist__c tourist : tourists) {  
            String Name = tourist.Name;
            Integer countFlights = (countFlights.get(tourist.Id));            
            textEmail += + '<a href='+ URL.getSalesforceBaseUrl().toExternalForm()+'/'+ tourist.Id +'> ' + Name + '</a> - removed ' + countFlights + ' flights. <br/>';
        }        
        EmailService.sendEmail(emails, textEmail);
    }    
}