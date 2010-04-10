// Place your application-specific JavaScript vars and classes here
// This file is automatically included by javascript_include_tag :defaults
var Application = (function(_){

  //initializes this object
  var initialize = function(){};
  
  //shows the body content
  var show = function(){
  	$('body').show();
  };
  
  //Returns the Hex value of a color in RGB format.
  var rgbToHex = function(red, green, blue)
  {
    return intToHex(red) + intToHex(green) + intToHex(blue);
  };

  //converts an decimal number between 0 and 255 to hex
  var intToHex = function(n){
    return "0123456789abcdef".charAt(parseInt(n / 16))
    + "0123456789abcdef".charAt(parseInt(n % 16));
  };

  //appends a style tag to the page
  var appendCssToPage = function(cssRules){
    var style = _('<style>').append(cssRules);
    _('#generated_styles').append(style);
  };

  //resets the selected color. Returns an array with the value.
  var resetColor = function(red, green, blue, new_value){
    if(red >= green){
      if(red >= blue){
        red = new_value;
      }else{
        blue = new_value;
      }
    }else{
      if(green >= blue){
        green = new_value;
      }else{
        blue = new_value;
      }
    }
    return [red,green,blue];
  };

  //If the orinal value is expectedValue, then returns it as it is, if not, then return
  //the potencial value
  var colorOrNewValue = function(originalValue, expectedValue, potencialValue){
    return (originalValue == expectedValue) ? originalValue : potencialValue ;
  };

  //changes the color schema of the page depending on a received color.
  var changeColorSchema = function(red, green, blue){
    var new_color = resetColor(red, green, blue, 255);

    var back_color = rgbToHex(red, green, blue);
    var front_color = rgbToHex(colorOrNewValue(new_color[0], 255, 217), colorOrNewValue(new_color[1], 255, 217), colorOrNewValue(new_color[2], 255, 217));
    var border_color = rgbToHex(colorOrNewValue(new_color[0], 255, 161), colorOrNewValue(new_color[1], 255, 161), colorOrNewValue(new_color[2], 255, 161));
    var header_color = rgbToHex(colorOrNewValue(new_color[0], 255, 100), colorOrNewValue(new_color[1], 255, 100), colorOrNewValue(new_color[2], 255, 100));

    var rules = createCssRule('.whole-wrapper', backgroundColor(back_color));
    rules += createCssRule('.content-wrapper', backgroundColor(front_color) + borderColor(front_color));

    //border rule
    rules += createCssRule('.whole-wrapper > .table.default-table,.whole-wrapper > table.default-table td,.whole-wrapper > table.listing,.whole-wrapper > table.listing tr.even,.whole-wrapper > table.listing td,.whole-wrapper > #styled-form #field-set,.whole-wrapper > #styled-form #field-set h3,.whole-wrapper > #styled-form #content-wrapper,.whole-wrapper > .big-button', borderColor(border_color));
    //other rules
    rules += createCssRule('table.listing tr.even', backgroundColor(border_color));
    rules += createCssRule('table.listing th ', backgroundColor(header_color));
    rules += createCssRule('table.listing, table.listing td ', borderColor(border_color));

    //link css
    new_color = resetColor(red, green, blue, 179);
    var navigation_color = rgbToHex(colorOrNewValue(new_color[0], 179, 79), colorOrNewValue(new_color[1], 179, 79), colorOrNewValue(new_color[2], 179, 79));
    rules += createCssRule('.secondary-menu li a:hover, .secondary-menu li.selected ', backgroundColor(navigation_color));
    //color selector must change its color two.
    rules += createCssRule('.color-select', backgroundColor(back_color));

    appendCssToPage(rules);
  };

  //returns a border color css attribute
  var borderColor = function(color){
    return createCssAttribute('border-color', '#' + color);
  };

  //returns a background color css attribute
  var backgroundColor = function(color){
    return createCssAttribute('background-color', '#' + color);
  };

  //Returns an attribute for a css rule
  var createCssAttribute = function(name, value){
    return name + ":" + value + ";";
  };
  //returns a css rule.
  var createCssRule = function(name, attributes){
    return name + "{" + attributes + "}";
  };
  
  //executes an ajax request and changes the color of the layout
  var changeColor = function(user_id, red, green, blue, button){
  	var url = "/users/" + user_id + "/update_color";
	var params = "red=" + red + "&green=" + green + "&blue=" + blue;
	
	//Executes the ajax request using prototype
	new Ajax.Request(url,{
		method: 'post',
		parameters: params,
		asynchronous: true,
		onSuccess: function(transport){
			changeColorSchema(red, green, blue);
			$(button).toggle();		
		}
	});
	
  };
  
  return{
    'initialize': initialize,
    'changeColorSchema': changeColorSchema,
	'show': show,
	'changeColor': changeColor
  }
})(_);