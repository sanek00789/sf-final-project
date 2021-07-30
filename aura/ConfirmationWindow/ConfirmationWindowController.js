({
    handleClickYes : function(component, event, helper) {
        const cmpEvent = component.getEvent("clickYes");        
        cmpEvent.fire();        
    },
    
    handleClickNo : function(component, event, helper) {
        const cmpEvent = component.getEvent("clickNo");        
        cmpEvent.fire();
    }
})