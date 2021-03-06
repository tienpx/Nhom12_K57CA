NHOM12K57ca::Application.routes.draw do
  get "mindmaps/index", as: "mindmaps_index"
  get "draw/index"
  get "users/new"
  post "mindmaps/load_lib_image", format: :js
  post "mindmaps/save"

  get "mindmap/index", as: "mindmap_index"
  post "mindmap/load_lib_image", format: :js
  post "mindmap/save"

  root :to => 'static_pages#home'
  resources :users do
    resources :mindmaps
  end
  match '/signup',  to: 'users#new', via: 'get'
  get '/static_pages/home', :to =>'static_pages#home'
  
  match "/signin", to: "sessions#new", via: 'get'
  match "/signin", to: "sessions#create", via: 'post'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

  #post "/"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
