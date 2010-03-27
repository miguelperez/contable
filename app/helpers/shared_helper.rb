module SharedHelper
  #Returns a li with a link for a tabbed bar.
  #+link_label+ would be the label for the tab, and also must be the name of the
  #tab that will be shown when the user clicks this link.
  def tab_link(link_label)
    href = sanitize_latin_characters(link_label.downcase.squeeze(" ").strip.gsub(/ /, '_'))
    "<li><a href=\"##{href}\">#{link_label}</a></li>"
  end

  #Returns a div which will have a tab body. This receives a block with html that
  #will be appended into the div.
  def tabbed_body(tab_name, display = true, &block)
    class_name = !display ? "class = \"display-none tab\"" : "class = \"tab\""
    name = sanitize_latin_characters(tab_name.downcase.squeeze(" ").strip.gsub(/ /, '_'))
    concat("<div #{class_name} id=\"#{name}\">")
    yield
    concat("</div>")
  end

  #Returns a sanitized string without any latin characters.
  def sanitize_latin_characters(string)
    string.gsub(/[áÁ]/,'a').
      gsub(/[éÉ]/,'e').
      gsub(/[íÍ]/,'i').
      gsub(/[óÓ]/,'o').
      gsub(/[úÚ]/,'u').
      gsub(/[ñÑ]/,'n')
  end
end