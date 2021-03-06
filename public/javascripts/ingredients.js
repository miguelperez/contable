//Ingredients Helper
var IngredientsHelper = (function(){
  var initialize = function(){
  };

  //creates the add ingredients fields.
  //ingredient_object is a json of the ingredient that will be added, it has the ingredient information.
  //parent_div is the object which will hold the fields for adding the new ingredient.
  //child_elem is the object which trigger this function to be called, must be hidden after adding the ingredient.
  //label_title is the title that will be added to the ingredient field.
  //hash_name will be the name used for generating the id and name of the created input text.
  var createIngredientForm = function(ingredientObject, parentDiv, childElem, label_title, hash_name){
    //lets assing an id to the containing li, if it does not have id set.
    childElem.identify();

    //check if childElem is hidden if its, then we shall not add the ingredient form
    if(childElem.getStyle('display') == 'none' || childElem.getStyle('visibility') == 'hidden'){
      return;
    }else{
      childElem.hide();
    }
    
    var h4 = new Element('h4').insert(ingredientObject.ingredient.name);
    var label = new Element('label', {
      'class':'styled-label'
    }).insert(label_title);
    var hidden = new Element('input', {
      'type':'hidden',
      'id': hash_name + '_new_formula_attributes__ingredient_id',
      'name': hash_name + '[new_formula_attributes][][ingredient_id]',
      'value':ingredientObject.ingredient.id
    });
    var input = new Element('input', {
      'type':'text',
      'class':'styled-input',
      'id': 'new_formula_attributes__ingredient_ammount',
      'name': hash_name + '[new_formula_attributes][][ingredient_ammount]'
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
  }

  //creates the ingredient tag
  //ingredient_object is a json of the ingredient that will be added, it has the ingredient information.
  //parentContainer is the object which will hold the tag for adding the new ingredient.
	//label is the label we want to show next to the field
	//hashName is the name of the model that will have the ingredients
  var createIngredientTag = function(ingredientObject, parentContainer, label, hashName){
    var span = new Element('span').insert(ingredientObject.ingredient.name);
    var json = '{"ingredient":{"name":"'+ingredientObject.ingredient.name+'","id":'+ingredientObject.ingredient.id+'}}';
    var a = new Element('a', {
      'href':'#',
      'class':'tag',
      'onclick':'IngredientsHelper.createIngredientForm('+ json +', $("ingredients_form"), this.up(), "' + label + '", "' + hashName + '")'
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