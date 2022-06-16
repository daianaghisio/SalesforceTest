({
   
    showToast: function(titulo, mensaje, tipo) {
        var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": titulo,
                    "message": mensaje,
                    "type" : tipo
                });
                toastEvent.fire();
    }, 
    
        showToastEmpty : function(component, event, helper) {
            var toastEvent = $A.get("e.force:showToast");
            toastEvent.setParams({
                "title": "No color to show!",
                "message": "This account doesn't have any colors."
            });
            toastEvent.fire();
        }

})