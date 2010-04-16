SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.dom_class = 'main-menu'

    primary.item :dashboard, t('navigation.dashboard'), dashboard_path, :class => 'first'

    primary.item :'separator', '', "", :class => 'separator'
    
    primary.item :company, t('navigation.company'), companies_path do |secondary|
      secondary.dom_class = 'secondary-menu'
      secondary.item :new_company, t('navigation.add'), new_company_path
    end

    primary.item :'separator', '', "", :class => 'separator'
    
    primary.item :client, t('navigation.clients'), clients_path do |secondary|
      secondary.dom_class = 'secondary-menu'
      secondary.item :new_client, t('navigation.add'), new_client_path
    end

    primary.item :'separator1', '', "", :class => 'separator'

    primary.item :order, t('navigation.orders'), new_order_path  do |secondary|
      secondary.dom_class = 'secondary-menu'
      secondary.item :new_order, t('navigation.active_orders'), orders_path
      secondary.item :new_order, t('navigation.create'), new_order_path
      secondary.item :paid_orders, t('navigation.paid_orders'), paid_orders_path
    end

    primary.item :'separator2', '', "", :class => 'separator'

    primary.item :ingredient, t('navigation.ingredients'), ingredients_path  do |secondary|
      secondary.dom_class = 'secondary-menu'
      secondary.item :new_ingredient, t('navigation.add'), new_ingredient_path
    end

    primary.item :'separator3', '', "", :class => 'separator'

    primary.item :product, t('navigation.products'), products_path  do |secondary|
      secondary.dom_class = 'secondary-menu'
      secondary.item :new_product, t('navigation.add'), new_product_path
    end

    primary.item :'separator4', '', "", :class => 'separator'

    primary.item :product_presentation, t('navigation.product_presentations'), product_presentations_path, :class => 'last'
  end
end
## Configures your navigation
#SimpleNavigation::Configuration.run do |navigation|
#  # Specify a custom renderer if needed.
#  # The default renderer is SimpleNavigation::Renderer::List which renders HTML lists.
#  # navigation.renderer = Your::Custom::Renderer
#
#  # Specify the class that will be applied to active navigation items. Defaults to 'selected'
#  # navigation.selected_class = 'your_selected_class'
#
#  # Item keys are normally added to list items as id.
#  # This setting turns that off
#  # navigation.autogenerate_item_ids = false
#
#  # You can override the default logic that is used to autogenerate the item ids.
#  # To do this, define a Proc which takes the key of the current item as argument.
#  # The example below would add a prefix to each key.
#  # navigation.id_generator = Proc.new {|key| "my-prefix-#{key}"}
#
#  # The auto highlight feature is turned on by default.
#  # This turns it off globally (for the whole plugin)
#  # navigation.auto_highlight = false
#
#  # Define the primary navigation
#  navigation.items do |primary|
#    # Add an item to the primary navigation. The following params apply:
#    # key - a symbol which uniquely defines your navigation item in the scope of the primary_navigation
#    # name - will be displayed in the rendered navigation. This can also be a call to your I18n-framework.
#    # url - the address that the generated item links to. You can also use url_helpers (named routes, restful routes helper, url_for etc.)
#    # options - can be used to specify attributes that will be included in the rendered navigation item (e.g. id, class etc.)
#    #
#    primary.item :key_1, 'name', url, options
#
#    # Add an item which has a sub navigation (same params, but with block)
#    primary.item :key_2, 'name', url, options do |sub_nav|
#      # Add an item to the sub navigation (same params again)
#      sub_nav.item :key_2_1, 'name', url, options
#    end
#
#    # You can also specify a condition-proc that needs to be fullfilled to display an item.
#    # Conditions are part of the options. They are evaluated in the context of the views,
#    # thus you can use all the methods and vars you have available in the views.
#    primary.item :key_3, 'Admin', url, :class => 'special', :if => Proc.new { current_user.admin? }
#    primary.item :key_4, 'Account', url, :unless => Proc.new { logged_in? }
#
#    # you can also specify a css id or class to attach to this particular level
#    # works for all levels of the menu
#    # primary.dom_id = 'menu-id'
#    # primary.dom_class = 'menu-class'
#
#    # You can turn off auto highlighting for a specific level
#    # primary.auto_highlight = false
#
#  end
#
#end