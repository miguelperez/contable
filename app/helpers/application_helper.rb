module ApplicationHelper
  def body_class
    "#{controller.controller_name} #{controller.controller_name}-#{controller.action_name}"
  end

  #Adds and image tag from the fam fam fam icon set.
  #Receives the +name+ of the image, and a hash with html +options+
  def fam_fam_icon(name, options = {})
    image_tag "icons/#{name}.png", options
  end

  #Clears all the html form elements types received in the +form_elements_types+
  #that are contained in the div with class +div_class+
  def clear_form_link(div_class, form_elements_types = [])
    link_to_function "clear" , "$$('.#{div_class} #{form_elements_types.join(" ")}').each(function(item){item.clear();})"
  end

  #returns a round button div.
  #Receives a +name+ which will be the name of the class that will have this button
  #and receives an array of html attributes that will be given to the button.
  def round_button(name, text = "",  options = {})
    attr = ""
    options.each do |key, value|
      attr += "#{key.to_s}='#{value}' "
    end
    if (text.eql?(""))
      "<div class='round-button #{name}' #{attr}></div>"
    else
      "<div class='round-button-wrapper' #{attr}><div class='round-button #{name}'></div>#{text}</div>"
    end
  end

  #returns a tag. This is for listing ingredients.
  #receives the tag +label+, and a hash of html attributes for an html a tag.
  def a_as_tag(label, options = {})
    attr = ""
    options.each do |key, value|
      attr += "#{key.to_s}=#{value} "
    end
    "<a href='#' class='tag' #{attr}><span>#{label}</span></a>"
  end
end
