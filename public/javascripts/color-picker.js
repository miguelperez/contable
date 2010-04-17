//this objects creates a color picker for using in rails.
//it depends on the JQuery UI slider component.
var ColorPicker = (function(_){
  var default_options = {
    red: 'Red',
    green: 'Green',
    blue: 'Blue',
    model: 'color',
    redValue: '',
    greenValue: '',
    blueValue: ''
  };
  
  //initializes this object, receives the name of the parent that 
  //will hold the color picker. Must receive the 
  var initialize = function(parentDiv, options){
    if (!options) {
      options = {
        model: 'color'
      };
    }
    //merging user options with default options
    var opt = objectMerge(default_options, options);
    createColorPicker(parentDiv, opt);
  };
  
  /////////////////////
  ////////////////////////////////////// PRIVATE METHODS ///////////////////////////////////////////
  /////////////////////
  
  //creates a color picker. It returns a set of html elements
  //representing the color picker.
  var createColorPicker = function(parentDiv, options){
    //create the divs.
    var redDiv = _('<div id="red">');
    var greenDiv = _('<div id="green">');
    var blueDiv = _('<div id="blue">');
    
    var table = _('<table width="100%">');
    table.append(createTableRow(options.red, redDiv));
    table.append(createTableRow(options.green, greenDiv));
    table.append(createTableRow(options.blue, blueDiv));
    table.append(createColorRow());
    //create the hidden fields
    
    var redHidden = createHiddenField('red', options.model, options.redValue);
    var greenHidden = createHiddenField('green', options.model, options.greenValue);
    var blueHidden = createHiddenField('blue', options.model, options.blueValue);
    
    //give the divs sliders functionality and sets their initial value
    initializeSlider(redDiv, options.redValue, redHidden);
    initializeSlider(greenDiv, options.greenValue, greenHidden);
    initializeSlider(blueDiv, options.blueValue, blueHidden);
    
    //append sliders and hidden fields to parent
    parentDiv.append(table);
    parentDiv.append(redHidden);
    parentDiv.append(greenHidden);
    parentDiv.append(blueHidden);
    
    //Appending styles to the head of the page
    appendStyles();
		refreshColor();
  };
  
  //initializes a slider. It gives the slider functionality to a div.
  //div will hold the slider functionality.
  //value will be the initial value of the slider.
  //hiddenField is the object that is gonna be updated everytime the value changes.
  var initializeSlider = function(div, value, hiddenField){
    _(div).slider({
      range: "max",
      min: 0,
      max: 255,
      value: value,
      slide: function(event, ui){
        updateHidden(event, ui, hiddenField);
      },
      change: function(event, ui){
        updateHidden(event, ui, hiddenField);
      }
    });
    _(div).slider("value", value);
  };
  
  //updates the hidden value
  var updateHidden = function(event, ui, hiddenField){
    _(hiddenField).val(ui.value);
    refreshColor();
  };
  
  //refreshes the color div
  var refreshColor = function(){
    //if the divs are already positioned on the pgae we should calculate this. Otherwise not.
		console.log(_('#red'));
		if (_('#red').length > 0 && _('#green').length > 0 && _('#blue').length > 0) {
      var hex = rgbToHex(_('#red').slider("value"), _('#green').slider("value"), _('#blue').slider("value"));
      _("#color_div").css("background-color", "#" + hex);
    }
  };
  
  //Returns the Hex value of a color in RGB format.
  var rgbToHex = function(red, green, blue){
    return intToHex(red) + intToHex(green) + intToHex(blue);
  };
  
  //converts an decimal number between 0 and 255 to hex
  var intToHex = function(n){
    return "0123456789abcdef".charAt(parseInt(n / 16)) +
    "0123456789abcdef".charAt(parseInt(n % 16));
  };
  
  //Creates a hidden field that will hold the value of the selected slider.
  var createHiddenField = function(color, model, value){
    var id = " id=" + model + "_" + color;
    var name = " name=" + model + "[" + color + "]";
    return _('<input type="hidden"' + id + name + '>').val(value);
  }
  
  //creates a row for an html table that will hold the color 
  var createColorRow = function(){
    var colorDiv = _('<div id="color_div" style="height:100%; width:100%">');
    var colorTd = _('<td colspan="2" height="20">').append(colorDiv);
    return _('<tr>').append(colorTd);
  }
  
  //creates a row for an html table 
  var createTableRow = function(label, slider){
    var labelTd = _('<td width="50">').append(label);
    var sliderTd = _('<td>').append(slider);
    return _('<tr>').append(labelTd).append(sliderTd);
  }
  
  //adds to the bottom of the head tag the styls for the color picker.
  var appendStyles = function(){
    var styles = "#red .ui-slider-range { background: #ef2929; }" +
    "#red .ui-slider-handle { border-color: #ef2929; }" +
    "#green .ui-slider-range { background: #8ae234; }" +
    "#green .ui-slider-handle { border-color: #8ae234; }" +
    "#blue .ui-slider-range { background: #729fcf; }" +
    "#blue .ui-slider-handle { border-color: #729fcf; }";
    _('head').append(_('<style type="text/css">').append(styles));
  };
  
  // Merges two objects. The second object overwrites the first object
  var objectMerge = function(receiver, options){
    var resulting_options = cloneObj(receiver);
    for (option_index in options) {
      resulting_options[option_index] = options[option_index];
    }
    return resulting_options;
  };
  
  //Clones an object. Taken from notification.js
  function cloneObj(o){
    if (typeof(o) != 'object') 
      return o;
    if (o == null) 
      return o;
    var newO = new Object();
    for (var i in o) 
      newO[i] = cloneObj(o[i]);
    return newO;
  }
  
  return {
    'initialize': initialize,
  }
})(_);
