@RestResource(urlMapping='/Tourist/*')
global with sharing class TouristRestService {
    
    @HttpGet
    global static void getTourists() {        
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;        
        Map<String,String> paramsMap = req.params;
        String fuzzyname = paramsMap.get(Constans.REQUEST_PARAMETR_FUZZYNAME);
        String ageString = paramsMap.get(Constans.REQUEST_PARAMETR_AGE);        
        
        try {            
            if (String.isEmpty(ageString)) {
                List<Tourist__c> touristsWithoutAge = TouristManager.getByFuzzyname(fuzzyname);
                res.responseBody = Blob.valueOf(JSON.serializePretty(touristsWithoutAge));
                res.statusCode = Constans.STATUS_CODE_200;
            } else if (String.isBlank(fuzzyname)) {
                res.responseBody = Blob.valueOf(Constans.THE_NAME_MUST_BE_NOT_EMPRY);
                res.statusCode = Constans.STATUS_CODE_404;
                return;            
            } else if (String.isNotBlank(ageString) && !ageString.isNumeric()) {
                res.responseBody = Blob.valueOf(Constans.THE_AGE_MUST_BE_A_NUMBER);
                res.statusCode = Constans.STATUS_CODE_404;
                return;
            } else {
                List<Tourist__c> tourists = TouristManager.getByFuzzynameAndAge(fuzzyname, Integer.valueOf(ageString)) ;    
                res.statusCode = Constans.STATUS_CODE_200;
                res.responseBody = Blob.valueOf(JSON.serializePretty(tourists));
            }
        }
        catch (TypeException te) {
            System.debug(te.getMessage()); 
        }
        catch (Exception e) {
            System.debug(e.getMessage()); 
        }
    }
    
    @HttpPost
    global static void createTourist(String name, Date birthdate, String email) {
        RestResponse res = RestContext.response;
        Tourist__c newTourist = new Tourist__c();
        newTourist.Name = name;
        newTourist.Birthdate__c = birthdate;
        newTourist.Email__c = email;
        List<Tourist__c> tourists = TouristManager.getByNameAndEmail(name, email);
        if(!tourists.isEmpty()){
            res.statusCode = Constans.STATUS_CODE_409;
        } else {
            insert newTourist;    
        }
    }
}