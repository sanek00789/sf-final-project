({
	doInit : function (component, event, helper) {        
        let selectedTrip = component.get("v.selectedTrip");
        helper.getWeather(component, event);
        helper.getSpacePoint(component, event);
    }  
})