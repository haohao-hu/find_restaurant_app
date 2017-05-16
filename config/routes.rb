Rails.application.routes.draw do

  root 'static_pages#home'
  get 'ote_list' => 'static_pages#ote_list'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users
  
  get 'restaurant_name_search' => 'restaurants#search'
  get 'restaurant_signup' => 'restaurants#new'
  get 'restaurant_login' => 'restaurant_sessions#new'
  post 'restaurant_login' => 'restaurant_sessions#create'
  delete 'restaurant_logout' => 'restaurant_sessions#destroy'
  resources :restaurants
  resources :reviews, only: [:create, :destroy]
  i=1;
  while (i<9755)
   get "opinion_target_#{i}" => "static_pages#opinion_target_#{i}"
   i=i+1
  end

  j=1;
  while (j<11)
   get "/ot_list_OTE_YRRNorthYork_YRRCmodelBROWNW2V_1415combined_descending_#{j}.html" => "static_pages#ot_list_OTE_YRRNorthYork_YRRCmodelBROWNW2V_1415combined_descending_#{j}"
   j=j+1
  end
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
