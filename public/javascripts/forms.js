//Object that have to basic operations: disable or enable all the child
//elements of a container within a form
var FormDisabler = (function(){
  var initialize = function(){};

  var toggleDisabled = function(form, container){
    Form.getElements(form).each(function(elem){
      if(elem.ancestors().include(container)){
        return elem.disabled() ? elem.enable() : elem.disable();
      }
    });
  };

  return{
    'initialize': initialize,
    'toggleDisabled': toggleDisabled
  }
})();
FormDisabler.initialize();