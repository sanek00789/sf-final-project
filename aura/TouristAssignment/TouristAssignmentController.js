({
    fetchTrips : function(component, event, helper) {
        component.set("v.showDetails", false);
        helper.fetchTrips(component, event)		        
    },
    
    clickCreate : function (component, event, helper) {            
        component.set("v.showModal", true); 
    },
    
    getTripDetails : function (component, event, helper) {
        let selectedItem = event.currentTarget; // Get the target object
        let index = selectedItem.dataset.record; // Get its value i.e. the index
        let selectedTrip = component.get("v.trips")[index];
        component.set("v.selectedTrip", selectedTrip);
        component.set("v.selectedTripId", selectedTrip.Id);
        component.set('v.mapMarkers', [
            {
                location: {                    
                    City: selectedTrip.Name                    
                }
            }
        ]);		       
        component.set("v.showDetails", true);
    },
    
    onSubmit : function(component, event, helper) {
        const hideModal = component.get('v.showModal');
        const action = component.get('c.createFlight');
        action.setParams({
            touristId: component.get('v.selectedId'),
            tripId: component.get('v.selectedTripId')
        });
        action.setCallback(this, function(response){
            const state = response.getState();            
            if (state === 'SUCCESS') {
                const records =response.getReturnValue();                
        		const title = $A.get("$Label.c.Successfully");
                const message = $A.get("$Label.c.flightsCreatedSuccessfully");
                const type = 'success'
                helper.showToast(title, message, type);
            } else if (state === "ERROR") {
                const errors = action.getError();
                const title = $A.get("$Label.c.Error");
                const message = (errors.length) ? errors[0].message : $A.get("$Label.c.flightCreationError");                
                const type = 'error';
                helper.showToast(title, message, type);
            }
            component.set('v.showModal', !hideModal);
        });        
        $A.enqueueAction(action);        
    },
    
    onCancel : function(component) {
        const showModal = component.get('v.showModal');
        component.set('v.showModal', !showModal);
    }
})