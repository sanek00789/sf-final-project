public class NumberUtility {
    
    public static List<Integer> getPrimeNumbers (Integer inputNum) {
        List<Integer> results = new List<Integer> ();
        
        for (Integer i = 2; i < inputNum; i++) {
            Integer k = 0;
            for (Integer j = 1; j <= i; j++) {
                if (math.mod(i, j) == 0) {
                    k++;
                }
            }
            if (k == 2) {
                results.add(i);
            }
        }        
        return results;
    }
    
    public static List<Integer> getFibanachiNumbers (Integer inputNum) {
        List<Integer> listResults = new List<Integer> ();
        Integer i = 1;
        Integer i2 = 0;
        Integer sum = 0;        
        while (i < inputNum) {
            if (sum < inputNum) {
                listResults.add(sum);
            }
            sum = i + i2;
            i = i2;
            i2 = sum;
        }        
        return listResults;
    }
    
    public static Boolean isPalindrom (Integer numToCheck) {        
        String varText = numToCheck.format();
        String revNumber = varText.reverse();        
        return varText == revNumber;        
    }
}