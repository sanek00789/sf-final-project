@isTest
public class FlightDeleteSchedulableTest {
    
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    @isTest
    static void testFlightDeleteSchedulable() {
        
        Test.startTest();
        FlightDeleteSchedulable flightDeleteSchedulable = new FlightDeleteSchedulable();         
        String jobId = System.schedule('FlightDeleteSchedulable', CRON_EXP, flightDeleteSchedulable); 
        Test.stopTest();
        
        CronTrigger ct = [
            SELECT Id, 
            	CronExpression,
            	TimesTriggered, 
            	NextFireTime
            FROM CronTrigger 
            WHERE id = :jobId
        ];     
        System.assertEquals(CRON_EXP, ct.CronExpression);
        System.assertEquals(0, ct.TimesTriggered);
        System.assertEquals('2022-03-15 00:00:00', String.valueOf(ct.NextFireTime));
    }
}