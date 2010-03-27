//Ingredients Helper
var IngredientsHelper = (function(){
  var initialize = function(){
  };

  //creates the add ingredients fields.
  var createIngredientForm = function(ingredientObject, parentDiv, childElem, label_title){
    //lets assing an id to the containing li, if it does not have id set.
    childElem.identify();
    
    var h4 = new Element('h4').insert(ingredientObject.ingredient.name);
    var label = new Element('label', {
      'class':'styled-label'
    }).insert(label_title);
    var hidden = new Element('input', {
      'type':'hidden',
      'id':'product_new_formula_attributes__ingredient_id',
      'name':'product[new_formula_attributes][][ingredient_id]',
      'value':ingredientObject.ingredient.id
    });
    var input = new Element('input', {
      'type':'text',
      'class':'styled-input',
      'id':'product_new_formula_attributes__ingredient_ammount',
      'name':'product[new_formula_attributes][][ingredient_ammount]'
    });
    var roundButton = new Element('div', {
      'class':'round-button delete',
      'onclick': '$(this).up(".ingredient").remove(); $("'+childElem.identify()+'").show();'
    });
    //create the container div and insert the products objects
    var containerDiv = new Element('div', {
      'class':'ingredient'
    }).insert(h4).insert(label).insert(hidden).insert(input).insert(roundButton);
    //adding to parent
    containerDiv.hide();
    parentDiv.insert(containerDiv);
    containerDiv.show();
    childElem.hide();
  }

  //creates the tag
  var createIngredientTag = function(ingredientObject, parentContainer){
    var span = new Element('span').insert(ingredientObject.ingredient.name);
    var json = '{"ingredient":{"name":"'+ingredientObject.ingredient.name+'","id":'+ingredientObject.ingredient.id+'}}';
    var a = new Element('a', {
      'href':'#',
      'class':'tag',
      'onclick':'IngredientsHelper.createIngredientForm('+ json +', $("ingredients_form"), this.up())'
    }).insert(span);
    var li = new Element('li').insert(a);

    parentContainer[0].insert(li);
  };
  
  return{
    'initialize':initialize,
    'createIngredientForm': createIngredientForm,
    'createIngredientTag':createIngredientTag
  }
})();
IngredientsHelper.initialize();