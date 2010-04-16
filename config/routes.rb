ActionController::Routing::Routes.draw do |map|
  map.resource :session, :controller => 'sessions', :only => [:new, :create, :destroy]
  map.sign_out 'sign_out', :controller => 'sessions', :action => 'destroy', :method => :delete
  
  map.resources :users, :member => {:update_color => :post}
  
  map.resources :companies
  
  map.resources :product_presentations, :member => {:add_ingredients => :get}
  
  map.resources :products, :member => {:add_ingredients => :get}
  
  map.resources :ingredients
  
  map.resources :orders, :collection => {:paid => :get}, :member => {:pay => :post}
  
  map.resources :clients
  
  map.with_options :controller => 'pages' do |page|
    page.dashboard 'dashboard', :action => 'dashboard'
  end
  
  map.root :controller => "sites", :action => :index
end
#== Route Map
# Generated on 15 Apr 2010 19:21
#
#                          new_session GET    /session/new(.:format)                               {:controller=>"sessions", :action=>"new"}
#                              session DELETE /session(.:format)                                   {:controller=>"sessions", :action=>"destroy"}
#                                      POST   /session(.:format)                                   {:controller=>"sessions", :action=>"create"}
#                                             /sign_out                                            {:method=>:delete, :controller=>"sessions", :action=>"destroy"}
#                                users GET    /users(.:format)                                     {:controller=>"users", :action=>"index"}
#                                      POST   /users(.:format)                                     {:controller=>"users", :action=>"create"}
#                             new_user GET    /users/new(.:format)                                 {:controller=>"users", :action=>"new"}
#                    update_color_user POST   /users/:id/update_color(.:format)                    {:controller=>"users", :action=>"update_color"}
#                            edit_user GET    /users/:id/edit(.:format)                            {:controller=>"users", :action=>"edit"}
#                                 user GET    /users/:id(.:format)                                 {:controller=>"users", :action=>"show"}
#                                      PUT    /users/:id(.:format)                                 {:controller=>"users", :action=>"update"}
#                                      DELETE /users/:id(.:format)                                 {:controller=>"users", :action=>"destroy"}
#                            companies GET    /companies(.:format)                                 {:controller=>"companies", :action=>"index"}
#                                      POST   /companies(.:format)                                 {:controller=>"companies", :action=>"create"}
#                          new_company GET    /companies/new(.:format)                             {:controller=>"companies", :action=>"new"}
#                         edit_company GET    /companies/:id/edit(.:format)                        {:controller=>"companies", :action=>"edit"}
#                              company GET    /companies/:id(.:format)                             {:controller=>"companies", :action=>"show"}
#                                      PUT    /companies/:id(.:format)                             {:controller=>"companies", :action=>"update"}
#                                      DELETE /companies/:id(.:format)                             {:controller=>"companies", :action=>"destroy"}
#                product_presentations GET    /product_presentations(.:format)                     {:controller=>"product_presentations", :action=>"index"}
#                                      POST   /product_presentations(.:format)                     {:controller=>"product_presentations", :action=>"create"}
#             new_product_presentation GET    /product_presentations/new(.:format)                 {:controller=>"product_presentations", :action=>"new"}
#            edit_product_presentation GET    /product_presentations/:id/edit(.:format)            {:controller=>"product_presentations", :action=>"edit"}
# add_ingredients_product_presentation GET    /product_presentations/:id/add_ingredients(.:format) {:controller=>"product_presentations", :action=>"add_ingredients"}
#                 product_presentation GET    /product_presentations/:id(.:format)                 {:controller=>"product_presentations", :action=>"show"}
#                                      PUT    /product_presentations/:id(.:format)                 {:controller=>"product_presentations", :action=>"update"}
#                                      DELETE /product_presentations/:id(.:format)                 {:controller=>"product_presentations", :action=>"destroy"}
#                             products GET    /products(.:format)                                  {:controller=>"products", :action=>"index"}
#                                      POST   /products(.:format)                                  {:controller=>"products", :action=>"create"}
#                          new_product GET    /products/new(.:format)                              {:controller=>"products", :action=>"new"}
#                         edit_product GET    /products/:id/edit(.:format)                         {:controller=>"products", :action=>"edit"}
#              add_ingredients_product GET    /products/:id/add_ingredients(.:format)              {:controller=>"products", :action=>"add_ingredients"}
#                              product GET    /products/:id(.:format)                              {:controller=>"products", :action=>"show"}
#                                      PUT    /products/:id(.:format)                              {:controller=>"products", :action=>"update"}
#                                      DELETE /products/:id(.:format)                              {:controller=>"products", :action=>"destroy"}
#                          ingredients GET    /ingredients(.:format)                               {:controller=>"ingredients", :action=>"index"}
#                                      POST   /ingredients(.:format)                               {:controller=>"ingredients", :action=>"create"}
#                       new_ingredient GET    /ingredients/new(.:format)                           {:controller=>"ingredients", :action=>"new"}
#                      edit_ingredient GET    /ingredients/:id/edit(.:format)                      {:controller=>"ingredients", :action=>"edit"}
#                           ingredient GET    /ingredients/:id(.:format)                           {:controller=>"ingredients", :action=>"show"}
#                                      PUT    /ingredients/:id(.:format)                           {:controller=>"ingredients", :action=>"update"}
#                                      DELETE /ingredients/:id(.:format)                           {:controller=>"ingredients", :action=>"destroy"}
#                          paid_orders GET    /orders/paid(.:format)                               {:controller=>"orders", :action=>"paid"}
#                               orders GET    /orders(.:format)                                    {:controller=>"orders", :action=>"index"}
#                                      POST   /orders(.:format)                                    {:controller=>"orders", :action=>"create"}
#                            new_order GET    /orders/new(.:format)                                {:controller=>"orders", :action=>"new"}
#                            pay_order POST   /orders/:id/pay(.:format)                            {:controller=>"orders", :action=>"pay"}
#                           edit_order GET    /orders/:id/edit(.:format)                           {:controller=>"orders", :action=>"edit"}
#                                order GET    /orders/:id(.:format)                                {:controller=>"orders", :action=>"show"}
#                                      PUT    /orders/:id(.:format)                                {:controller=>"orders", :action=>"update"}
#                                      DELETE /orders/:id(.:format)                                {:controller=>"orders", :action=>"destroy"}
#                              clients GET    /clients(.:format)                                   {:controller=>"clients", :action=>"index"}
#                                      POST   /clients(.:format)                                   {:controller=>"clients", :action=>"create"}
#                           new_client GET    /clients/new(.:format)                               {:controller=>"clients", :action=>"new"}
#                          edit_client GET    /clients/:id/edit(.:format)                          {:controller=>"clients", :action=>"edit"}
#                               client GET    /clients/:id(.:format)                               {:controller=>"clients", :action=>"show"}
#                                      PUT    /clients/:id(.:format)                               {:controller=>"clients", :action=>"update"}
#                                      DELETE /clients/:id(.:format)                               {:controller=>"clients", :action=>"destroy"}
#                            dashboard        /dashboard                                           {:controller=>"pages", :action=>"dashboard"}
#                                 root        /                                                    {:controller=>"sites", :action=>"index"}
#                            passwords POST   /passwords(.:format)                                 {:controller=>"clearance/passwords", :action=>"create"}
#                         new_password GET    /passwords/new(.:format)                             {:controller=>"clearance/passwords", :action=>"new"}
#                                      GET    /session/new(.:format)                               {:controller=>"clearance/sessions", :action=>"new"}
#                                      DELETE /session(.:format)                                   {:controller=>"clearance/sessions", :action=>"destroy"}
#                                      POST   /session(.:format)                                   {:controller=>"clearance/sessions", :action=>"create"}
#                   edit_user_password GET    /users/:user_id/password/edit(.:format)              {:controller=>"clearance/passwords", :action=>"edit"}
#                        user_password PUT    /users/:user_id/password(.:format)                   {:controller=>"clearance/passwords", :action=>"update"}
#                                      POST   /users/:user_id/password(.:format)                   {:controller=>"clearance/passwords", :action=>"create"}
#                new_user_confirmation GET    /users/:user_id/confirmation/new(.:format)           {:controller=>"clearance/confirmations", :action=>"new"}
#                    user_confirmation POST   /users/:user_id/confirmation(.:format)               {:controller=>"clearance/confirmations", :action=>"create"}
#                                      GET    /users(.:format)                                     {:controller=>"clearance/users", :action=>"index"}
#                                      POST   /users(.:format)                                     {:controller=>"clearance/users", :action=>"create"}
#                                      GET    /users/new(.:format)                                 {:controller=>"clearance/users", :action=>"new"}
#                                      GET    /users/:id/edit(.:format)                            {:controller=>"clearance/users", :action=>"edit"}
#                                      GET    /users/:id(.:format)                                 {:controller=>"clearance/users", :action=>"show"}
#                                      PUT    /users/:id(.:format)                                 {:controller=>"clearance/users", :action=>"update"}
#                                      DELETE /users/:id(.:format)                                 {:controller=>"clearance/users", :action=>"destroy"}
#                              sign_up        /sign_up                                             {:controller=>"clearance/users", :action=>"new"}
#                              sign_in        /sign_in                                             {:controller=>"clearance/sessions", :action=>"new"}
#                             sign_out        /sign_out                                            {:method=>:delete, :controller=>"clearance/sessions", :action=>"destroy"}
