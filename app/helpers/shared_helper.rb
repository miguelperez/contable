module SharedHelper
  #Returns a li with a link for a tabbed bar.
  #+link_label+ would be the label for the tab, and also must be the name of the
  #tab that will be shown when the user clicks this link.
  def tab_link(link_label)
    "<li><a href=\"##{link_label.downcase.squeeze(" ").strip.gsub(/ /, '_')}\">#{link_label}</a></li>"
  end

  #Returns a div which will have a tab body. This receives a block with html that
  #will be appended into the div.
  def tabbed_body(tab_name, display = true, &block)
    class_name = !display ? "class = \"display-none tab\"" : "class = \"tab\""
    concat("<div #{class_name} id=\"#{tab_name.downcase.squeeze(" ").strip.gsub(/ /, '_')}\">")
    yield
    concat("</div>")
  end
end