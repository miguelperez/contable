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
      'onclick': '$(this).up(".ingredient").remove(); $("'+childElem.identify()+'").appear();'
    });
    //create the container div and insert the products objects
    var containerDiv = new Element('div', {
      'class':'ingredient'
    }).insert(h4).insert(label).insert(hidden).insert(input).insert(roundButton);
    //adding to parent
    containerDiv.hide();
    parentDiv.insert(containerDiv);
    containerDiv.appear();
    childElem.fade();
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

//methods for adding a product row to the products table
var TableHelper = (function(){
  var initialize = function(){};

  //creates an input form element.
  var createInput = function(type, id, name){
    var input = new Element('input', {
      'type':type,
      'name':name,
      'id': id,
      'size':10
    });
    return input;
  };
  
  //creates a td for a tr of a table.
  var createTd = function(tdContent){
    var td = new Element('td');
    td.insert(tdContent);
    return td;
  };

  //creates a row an inserts it at the bottom of the products table.
  var addRowToProductsTable = function(table, afterRow){
    var tr = new Element('tr', {
      'class': 'product-presentation'
    });
    var name = createInput('text',
      'product_new_product_presentation_attributes__name',
      'product[new_product_presentation_attributes][][name]');

    var description = createInput('text',
      'product_new_product_presentation_attributes__description',
      'product[new_product_presentation_attributes][][description]');

    var unitPrice = createInput('text',
      'product_new_product_presentation_attributes__unit_price',
      'product[new_product_presentation_attributes][][unit_price]');
    
    var roundButton = new Element('div', {
      'class':'round-button delete',
      'onclick': '$(this).up(".product-presentation").remove()'
    });

    tr.insert(createTd(name));
    tr.insert(createTd(description));
    tr.insert(createTd(unitPrice));
    tr.insert(createTd(roundButton));

    var row = $(afterRow);
    var tableBody = $(table).down();

    if(afterRow){
      row.remove();
      tableBody.insert({
        top: tr
      }).insert({
        top: row
      });
    }else{
      tableBody.insert({
        top: tr
      });
    }

  };

  return{
    'initialize':initialize,
    'addRowToProductsTable':addRowToProductsTable
  }
})();
TableHelper.initialize();