//Object that updates the client form
var Updater = (function(){
  var initialize = function() {
  //constructor
  }
  //Updates the client form given the received response from ajax request.
  var updateClientForm = function(element, li){
    $('id_number').down(1).setValue(li.readAttribute('i'));
    $('name').next('input[type=hidden]').setValue(li.innerHTML);
    $('last_name').down(1).setValue(li.readAttribute('ln'));
    $('address').down(1).setValue(li.readAttribute('ad'));
    $('email').down(1).setValue(li.readAttribute('em'));
  };

  //Updates the hidden field that holds the client name with the selected
  //name in the ajax updater text field.
  var updateNameAttribute = function(element){
    var element_p = element.up();
    element_p.next('input[type=hidden]').setValue(element.getValue());
  };

  //Updates the ajax updater with the value from the hidden name field.
  var getNameValue = function(element){
    var element_p = element.up();
    element.setValue(element_p.next('input[type=hidden]').getValue());
  }

  return {
    'initialize': initialize,
    'updateClientForm': updateClientForm,
    'updateNameAttribute': updateNameAttribute,
    'getNameValue': getNameValue
  }
})();
Updater.initialize();
