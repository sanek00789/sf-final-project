public class WeatherForecastUpdaterSchedulable implements Schedulable {
    
    public void execute (SchedulableContext sc) {
        WeatherForecastUpdater.updateForecasts();
    }

}