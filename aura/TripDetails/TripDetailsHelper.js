({	
    getSpacePoint : function (component) {        
        const action = component.get('c.getSpacePoint');
        action.setParams({            
            spacePointId: component.get('v.selectedTrip.Departure_Space_Point__c')
        });
        action.setCallback(this, function(response){
            const state = response.getState();           
            if (state === 'SUCCESS') {
                const records =response.getReturnValue();
                component.set('v.selectedSpacePoint', records);                
            } else if (state === "ERROR") {
                const errors = action.getError();
                const title = $A.get("$Label.c.Error");
                const message = (errors.length) ? errors[0].message : $A.get("$Label.c.spaisPointSearchError");
                const type = 'error';
                this.showToast(title, message, type);
            }
        });
        $A.enqueueAction(action);       
    },
    
    getWeather : function(component) {        
        let action = component.get("c.getTemperature");
        action.setParams({
            tripId : component.get("v.selectedTrip.Id")
        });
        action.setCallback(this, function(response) {
            let state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.averageTemperature", response.getReturnValue().Average_Temperature__c);
            } else if (state === "ERROR") {
                const errors = action.getError();
                const title = $A.get("$Label.c.Error");
                const message = (errors.length) ? errors[0].message : $A.get("$Label.c.temperatureSearchError");
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