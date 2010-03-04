//animates a sliding div.
function animate(div){
  _(div).slideToggle("slow");
}

var IngredientsHelper = (function(){
  var initialize = function(){
  };

  //creates the add ingredients fields.
  var createIngredientForm = function(ingredientObject, parentDiv, childElem){
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
      'onclick': '$(this).up(".formula").remove()'
    });
    //create the container div and insert the precious objects
    var containerDiv = new Element('div', {
      'class':'ingredient'
    }).insert(h4).insert(label).insert(input).insert(roundButton);
    //adding to parent
    parentDiv.insert(containerDiv);
    childElem.remove();
  }
  
  return{
    'initialize':initialize,
    'createIngredientForm': createIngredientForm
  }
})();
IngredientsHelper.initialize();