public class FlightDeleteSchedulable implements Schedulable {
    
    public void execute (SchedulableContext sc) {
        FlightDeleteBatch flightDeleteBatch = new FlightDeleteBatch();
        Database.executeBatch(flightDeleteBatch);
    }
}