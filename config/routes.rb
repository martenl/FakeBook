Martenlosansky::Application.routes.draw do
  
  post "user/search"
  
  match "friendshiprequest/show" => "friendshiprequest#show"
  
  match "user/friends/:id" => "user#friends"
  
  post "friendshiprequest/offer"
  
  get "friendshiprequest/list"
  
  match "friendshiprequest/kill/:id" => "friendshiprequest#kill"

  post "friendshiprequest/accept"

  match "user/message/read/:id" => "message#read" 

  get "user/message/write" => "message#write"

  post "user/message/write" => "message#writeWork"
  
  match "user/message/list" => "message#list"

  get "home/index"

  match "user/show/:id" => "user#show"
  
  get "user/show"
  
  get "user/destroy/:id" => "user#destroy"

  get "user/create" => "user#register"
  
  post "user/create"

  get "user/register"

  post "user/login"
  
  get "user/login" => "user#register"

  get "user/logout"
  
  get "user/list"
  
  root :to => "home#index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
