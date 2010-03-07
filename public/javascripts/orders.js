
function search(elem, product_id){
  var p = js[product_id];
  if(p){
    $(elem).up().next().down().setValue(p.description);
    $(elem).up().next().next().down().setValue(p.unit_price);
  }
}

function modifyTotal(value1, value2, receptor){
  value1 = parseInt(value1);
  value2 = parseInt(value2);
  
  if(!isNaN(value1) && !isNaN(value2)){

    $(receptor).value = value1 * value2;
    addToGrantTotal($$('.total').inject(0, function(acc, elem)
    {
      return acc + parseInt(elem.value);
    }));
  }
}
//creates the options for a select
function optionsForSelect(select, options, textForBlankOption){
  if(textForBlankOption){
    var opt = new Element('option', {
      "value":""
    }).insert(textForBlankOption);
    select.insert(opt)
  }

  options.each(function(pair){
    var opt = new Element('option', {
      "value":pair.key
    }).insert(pair.value);
    select.insert(opt);
  });
}
//creates an input form element.
function createInput(type, id, name){
  var input = new Element('input', {
    'type':type,
    'name':name,
    'id': id,
    'size':10
  });
  return input;
}
//creates a td for a tr of a table.
function createTd(tdContent){
  var td = new Element('td');
  td.insert(tdContent);
  return td;
}

//creates a row an inserts it at the bottom of the products table.
function addRowToProductsTable(table, beforeRow){
  var tr = new Element('tr', {
    'class': 'product-presentation'
  });
  //quantity
  var quantity= createInput('text',
    'order_new_order_product_presentations_attributes__quantity',
    'order[new_order_product_presentations_attributes][][quantity]');
  quantity.setAttribute('onkeyup', 'modifyTotal(this.value, this.up().next(2).down().value, this.up().next(3).down())');

  var select = new Element('select', {
    'id': 'order_new_order_product_presentations_attributes__product_presentation_id',
    'name': 'order[new_order_product_presentations_attributes][][product_presentation_id]',
    'onchange': "search(this, this.getValue()); modifyTotal(this.up().down().value, this.up().next(1).down().value, this.up().next(2).down())"
  });
  var options = new Hash();
  var id;
  for (id in js) {
    options.set(js[id].id, js[id].name);
  }
  optionsForSelect(select, options, "Select a product");

  var description = createInput('text',
    'product_presentation_description',
    'product_presentation[description]');

  var unitPrice = createInput('text',
    'order_new_order_product_presentations_attributes__unit_sold_price',
    'order[new_order_product_presentations_attributes][][unit_sold_price]');
  unitPrice.setAttribute('onkeyup', 'modifyTotal(this.value, this.up().previous(2).down().value, this.up().next().down())');

  var total = createInput('text', 'product_total_value', 'product[total_value]');
  total.addClassName('total');

  var roundButton = new Element('div', {
    'class':'round-button delete',
    'onclick': '$(this).up(".product-presentation").remove()'
  });

  tr.insert(createTd(quantity));
  tr.insert(createTd(select));
  tr.insert(createTd(description));
  tr.insert(createTd(unitPrice));
  tr.insert(createTd(total));
  tr.insert(createTd(roundButton));

  var row = $(beforeRow);
  var tableBody = $(table).down();

  if(beforeRow){
    row.remove();
    tableBody.insert(tr).insert(row);
  }else{
    tableBody.insert(tr);
  }
}

function addToGrantTotal(value){
  if(!isNaN(value)){
    $$('#grant-total-words')[0].setValue(NumberToWord.toWord(value));
    $$('.grant-total')[0].setValue(value);
  }
}

//This object will allow me to convert a number to a string. Based on the
//implementation given by Jose Felix Gomez in
//http://github.com/jfgomez86/number-to-words
var NumberToWord = (function(){
  numbers_hash = new Hash();

  var initialize = function() {
    this.numbers_hash.set(1, 'uno');
    this.numbers_hash.set(2, 'dos');
    this.numbers_hash.set(3, 'tres');
    this.numbers_hash.set(4, 'cuatro');
    this.numbers_hash.set(5, 'cinco');
    this.numbers_hash.set(6, 'seis');
    this.numbers_hash.set(7, 'siete');
    this.numbers_hash.set(8, 'ocho');
    this.numbers_hash.set(9, 'nueve');
    this.numbers_hash.set(10, 'diez');
    this.numbers_hash.set(11, 'once');
    this.numbers_hash.set(12, 'doce');
    this.numbers_hash.set(13, 'trece');
    this.numbers_hash.set(14, 'catorce');
    this.numbers_hash.set(15, 'quince');
    this.numbers_hash.set(16, 'dieciseis');
    this.numbers_hash.set(17, 'diecisiete');
    this.numbers_hash.set(18, 'dieciocho');
    this.numbers_hash.set(19, 'diecinueve');
    this.numbers_hash.set(20, 'veinte');
    this.numbers_hash.set(21, 'veintiuno');
    this.numbers_hash.set(22, 'veintidos');
    this.numbers_hash.set(23, 'veintitres');
    this.numbers_hash.set(24, 'veinticuatro');
    this.numbers_hash.set(25, 'veinticinco');
    this.numbers_hash.set(26, 'veintiseis');
    this.numbers_hash.set(27, 'veintisiete');
    this.numbers_hash.set(28, 'veintiocho');
    this.numbers_hash.set(29, 'veintinueve');
    this.numbers_hash.set(30, 'treinta');
    this.numbers_hash.set(40, 'cuarenta');
    this.numbers_hash.set(50, 'cincuenta');
    this.numbers_hash.set(60, 'sesenta');
    this.numbers_hash.set(70, 'setenta');
    this.numbers_hash.set(80, 'ochenta');
    this.numbers_hash.set(90, 'noventa');
    this.numbers_hash.set(100, 'cien');
    this.numbers_hash.set(200, 'doscientos');
    this.numbers_hash.set(300, 'trescientos');
    this.numbers_hash.set(400, 'cuatrocientos');
    this.numbers_hash.set(500, 'quinientos');
    this.numbers_hash.set(600, 'seiscientos');
    this.numbers_hash.set(700, 'setecientos');
    this.numbers_hash.set(800, 'ochocientos');
    this.numbers_hash.set(900, 'novecientos');
  };

  var toWord = function(number){
    if(number.length == 0)
    {
      return "";
    }
    number = parseInt(number);

    if( number < 31)
    {
      if( number == 0)
      {
        return "";
      }

      return this.numbers_hash.get(number);

    }
    else if( number < 100)
    {
      if( number % 10 == 0){
        return this.numbers_hash.get(number);
      }
      return this.numbers_hash.get(Math.floor(number/10)*10) + " y " + toWord(number % 10)
    }
    else if(number < 1000)
    {
      if( number % 100 == 0)
      {
        return this.numbers_hash.get(number);
      }
      if( number < 200)
      {
        return "ciento " + toWord(number % 100);
      }
      return toWord(Math.floor(number/100)*100) + " " + toWord(number % 100);
    }
    else if(number < 1000000)
    {
      if(number == 1000)
      {
        return "mil" ;
      }
      if(number < 2000)
      {
        return "mil " + toWord(number % 1000);
      }
      if(number % 1000 == 0)
      {
        return toWord(number/1000) + " mil";
      }
      return toWord(number/1000) + " mil " + toWord(number % 1000);
    }
    else
    {
      if(number > 999999999999)
      {
        return "Numero demasiado grande";
      }
      if(number == 1000000)
      {
        return "un millon" ;
      }
      if(number < 2000000)
      {
        return "un millon " + toWord(number % 1000000);
      }
      if(number % 1000000 == 0)
      {
        return toWord(number/1000000) + " millones";
      }
      return toWord(number/1000000) + " millones " + toWord(number % 1000000);
    }
  };

  return {
    'initialize': initialize,
    'toWord': toWord,
    'numbers_hash': numbers_hash
  }  
})();
NumberToWord.initialize();