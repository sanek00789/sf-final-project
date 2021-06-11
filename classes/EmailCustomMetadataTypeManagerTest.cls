@isTest
public class EmailCustomMetadataTypeManagerTest {
    
    @isTest
    public static void TestGetEmail () {        
        List<Email__mdt> data = EmailCustomMetadataTypeManager.getEmail();
        System.assert(data != null);
        System.assertEquals(2, data.size());        
    }
}