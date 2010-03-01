module ProductsHelper
  #creates a link for adding a products presentation to the products form
  #dinamycally
  def add_product_presentation_link(name)
    link_to_function name do |page|
      page.insert_html :bottom,
        :'product-presentations',
        :partial => 'products/product_presentation' ,
        :object => ProductPresentation.new
    end
  end

  #creates a link for adding a formula to the products form dinamycally
  def add_formula_link(name)
    link_to_function name do |page|
      page.insert_html :bottom,
        :'formulas',
        :partial => 'products/formula' ,
        :object => Formula.new
    end
  end
end
