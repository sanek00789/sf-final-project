@isTest
public class NumberUtilityTest {
    
    @isTest
    static void testGetPrimeNumbers() {
        List<Integer> primeNumbers = NumberUtility.getPrimeNumbers(30);
        System.assertEquals(10, primeNumbers.size());
        System.assertEquals(2, primeNumbers.get(0));
        System.assertEquals(29, primeNumbers.get(primeNumbers.size()-1));        
    }
   
    @isTest
    static void testGetFibanachiNumbers() {
        List<Integer> fibanachiNumbers = NumberUtility.getFibanachiNumbers(30);
        System.assertEquals(9, fibanachiNumbers.size());        
        System.assertEquals(21, fibanachiNumbers.get(fibanachiNumbers.size()-1));        
    }
    
    @isTest
    static void testIsPalindromForPolindrom() {
        Boolean isPalindrom = NumberUtility.isPalindrom(123321);
        System.assertEquals(true, isPalindrom);              
    }
    
    @isTest
    static void testIsPalindromForNotPolindrom() {
        Boolean isPalindrom = NumberUtility.isPalindrom(12332);
        System.assertEquals(false, isPalindrom);              
    }
}