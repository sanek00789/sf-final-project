public class TouristCustomDataManager {
    
    public static List<Email__mdt> getEmail () {
        List<Email__mdt> data = [
            SELECT Email_to_inform_you_about_the_removal_of__c 
            FROM Email__mdt
        ];
        return data;
    }
}