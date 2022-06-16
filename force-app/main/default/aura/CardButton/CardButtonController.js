({
  
    handleClick : function(component, event, helper) {

        var action = component.get("c.getColor"); 
        var currentRecordId =  component.get("v.recordId"); //ubicacion 
         action.setParams( { cuentaId : currentRecordId });

    
        action.setCallback(this, function(response) {
            
           
            var state = response.getState();
        console.log(state);

            if (state === "SUCCESS") {

                var color = response.getReturnValue();
                console.log(color);
                

                    if (color.successful) {
                    
                        helper.showToast('Success!', 'The record has been updated successfully :)', 'success' );
                        component.set('v.codigo', response.getReturnValue().colorCode);
                        $A.get('e.force:refreshView').fire();

                    } else {

                        helper.showToast('Error.', 'The record has NOT been updated successfully :(', 'error');
                    }
              
            }    
             else if (state === "INCOMPLETE") {
                // do something
            }
            else if (state === "ERROR") {
             
                var errors = response.getError();
                if (errors) {
                        helper.showToast('Ups.','Hubo un error. Hable con el administrador.','error');
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + 
                                errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            } 
        });

    $A.enqueueAction(action);
    
    },

    doInit: function(component, event, helper) {
        
      
        var action = component.get("c.getLatest");
        var currentRecordId =  component.get("v.recordId");
        action.setParams( { cuentaId : currentRecordId });
       

        action.setCallback(this, function(response) {
           
            var state = response.getState();
            var color = response.getReturnValue();
          
            if (state === "SUCCESS") {
               
                if(color==null){
                    helper.showToastEmpty();                    
                } else {
                    console.log(JSON.parse(JSON.stringify(response.getReturnValue()))); 
                      component.set('v.codigo', response.getReturnValue().colorCode__c);
                      helper.showToast('Genial!!','Recibimos el color más reciente correctamente!'); 
                }
              
            }
            else if (state === "INCOMPLETE") {
                // do something
            }
            else if (state === "ERROR") {
             
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + 
                                errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            } 
        });

    $A.enqueueAction(action);

    }
})