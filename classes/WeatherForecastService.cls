public class WeatherForecastService {
    public class WeatherForecastException extends Exception {}    
    
    public static Map<Date, Decimal> getForecasts(Decimal latitude, Decimal longitude) {        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        Map<Date, Decimal> dateAndTemperature = new Map<Date, Decimal>();
        String url =
            'https://api.weatherbit.io/v2.0/forecast/daily?lang=ru' +
            '&key=' + Constans.KEY_WEATHERBIT +
            '&lat=' + latitude +
            '&lon=' + longitude;
        request.setMethod(Constans.REQUEST_METHOD_GET);
        request.setEndpoint(url);        
        try {
            HttpResponse response = http.send(request);
            if (response.getStatusCode() == Constans.STATUS_CODE_200) {
                Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
                List<Object> days = (List<Object>) results.get(Constans.RESPONSE_DATA_DATA);
                                
                for (Object day :days) {                    
                    Map<String, Object> dailyData = (Map<String, Object>) day;
                    dateAndTemperature.put(date.valueOf(string.valueOf(dailyData.get(Constans.RESPONSE_DATA_DATETIME))),(decimal) (dailyData.get(Constans.RESPONSE_DATA_TEMP)));                
                }
            } else {
                throw new WeatherForecastException(Constans.ERROR_RECEIVING_REQUEST);
            }
        } catch (WeatherForecastException wfe) {
            System.debug(LoggingLevel.ERROR, wfe.getMessage());
        }         
        return dateAndTemperature;
    }
}