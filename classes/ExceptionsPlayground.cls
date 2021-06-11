public class ExceptionsPlayground {
    
    public class CustomException extends Exception {}
    
    public static void generateCustomException (Integer a, Integer b) {       
        if (a == b) throw new CustomException('Сannot be equal');  
    }
    
    public static void generateRegularException() {
        Trip__c tripTest = new Trip__c ();
        tripTest = [
            SELECT Name 
            FROM Trip__c
        ];      
    }
    
    public static void handleExceptions() {
        try {            
            ExceptionsPlayground.generateCustomException(5, 5);
            ExceptionsPlayground.generateRegularException();            
        } catch (CustomException ce) {            
            System.debug('Сaught a custom exception');
        } catch (QueryException qe) {
            System.debug(qe.getMessage());
            System.debug('Сaught a standard exception');
        }        
        System.debug('The program ended successfully');
    }
}