//animates a sliding div.
function animate(div){
  _(div).slideToggle("slow");
}

var IngredientsHelper = (function(){
  var initialize = function(){
  };

  //creates the add ingredients fields.
  var createIngredientForm = function(ingredientObject, parentDiv, childElem){
    //lets assing an id to the containing li, if it does not have id set.
    childElem.identify();
    
    var h4 = new Element('h4').insert(ingredientObject.ingredient.name);
    var label = new Element('label', {
      'class':'styled-label'
    }).insert('Ammount');
    var input = new Element('input', {
      'type':'text',
      'class':'styled-input'
    });
    var roundButton = new Element('div', {
      'class':'round-button delete',
      'onclick': '$(this).up(".ingredient").fade(); $("'+childElem.identify()+'").appear();'
    });
    //create the container div and insert the precious objects
    var containerDiv = new Element('div', {
      'class':'ingredient'
    }).insert(h4).insert(label).insert(input).insert(roundButton);
    //adding to parent
    containerDiv.hide();
    parentDiv.insert(containerDiv);
    containerDiv.appear();
    childElem.fade();
  }
  
  return{
    'initialize':initialize,
    'createIngredientForm': createIngredientForm
  }
})();
IngredientsHelper.initialize();