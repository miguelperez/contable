module ApplicationHelper
  def body_class
    "#{controller.controller_name} #{controller.controller_name}-#{controller.action_name}"
  end

   #Adds and image tag from the fam fam fam icon set.
  #Receives the name of the image
  def fam_fam_icon(name, options = {})
    image_tag "icons/#{name}.png", options
  end

  #Clears all the html form elements types received in the +form_elements_types+
  #that are contained in the div with class +div_class+
  #
  def clear_form_link(div_class, form_elements_types = [])
    link_to_function "clear" , "$$('.#{div_class} #{form_elements_types.join(" ")}').each(function(item){item.clear();})"
  end
end
