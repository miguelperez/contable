ActionController::Routing::Routes.draw do |map|
  map.resource :session, :controller => 'sessions'

  map.resources :users

  map.resources :product_presentations

  map.resources :products

  map.resources :ingredients

  map.resources :orders, :collection => {:paid => :get}

  map.resources :clients

  map.with_options :controller => 'pages' do |page|
    page.dashboard 'dashboard', :action => 'dashboard'
  end
  
  map.root :controller => "sites", :action => :index
end
