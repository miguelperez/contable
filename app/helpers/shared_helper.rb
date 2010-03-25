module SharedHelper
  #returns a li with a link for a tabbed bar.
  #+link_label+ would be the label for the tab, and also must be the name of the
  #tab that will be shown when the user clicks this link.
  def tab_link(link_label)
    "<li><a href=\"##{link_label.downcase.squeeze(" ").strip.gsub(/ /, '_')}\">#{link_label}</a></li>"
  end

  def tabbed_body(tab_name, &block)
    concat("<div id=\"#{tab_name.downcase.squeeze(" ").strip.gsub(/ /, '_')}\">", block.binding)
    yield
    concat("</div>", block.binding)
  end
end
