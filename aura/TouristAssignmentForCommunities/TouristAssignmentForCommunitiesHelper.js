({
	fetchTrips : function (component) {
        const url = $A.get('$Resource.TripImage');        
        component.set('v.backgroundImageURL', url);        
        const queryString = window.location.search;        
        const urlParams = new URLSearchParams(queryString);
        const id = urlParams.get('id')		
        component.set('v.selectedId', id);	
        const action = component.get('c.getTripsById');
        action.setParams({
            touristId: component.get('v.selectedId')
        });
        action.setCallback(this, function(response){
            const state = response.getState();
            if (state === 'SUCCESS') {
                const records =response.getReturnValue();                
                component.set('v.trips', records);                
            } else if (state === "ERROR") {
                const errors = action.getError();
                const title = $A.get("$Label.c.Error");
                const message = (errors.length) ? errors[0].message : $A.get("$Label.c.tripSearchError");
                const type = 'error';
                this.showToast(title, message, type);
            }
        });
        $A.enqueueAction(action); 
    },
    
    showToast: function (title, message, type) {
       const toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title" : title,
            "type" : type,
            "message" : message
        });
        toastEvent.fire();
    }
})