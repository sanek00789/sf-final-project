public class EmailCustomMetadataTypeManager {
    public static List<Email__mdt> getEmail () {
        List<Email__mdt> data = [
            SELECT Email_address__c,
            Label
            FROM Email__mdt
            WHERE Label = 'Email for notifications about flight del'
        ];
        return data;
    }
}