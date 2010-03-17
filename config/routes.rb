ActionController::Routing::Routes.draw do |map|
  map.resources :product_presentations

  map.resources :products

  map.resources :ingredients

  map.resources :orders, :collection => {:paid => :get}

  map.resources :clients
  
  map.root :controller => "clients"
end
