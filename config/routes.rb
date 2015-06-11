Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  resources :users
  resources :books
  resources :user_sessions
  # You can have the root of your site routed with "root"
  root 'home#index'
  match 'login' => 'user_sessions#new', :as => :login, via: [:get, :post]
  match 'logout' => 'user_sessions#destroy', :as => :logout, via: [:get, :post]
  match 'admin_home' => 'home#admin_home', :as => :admin_home, via: [:get, :post]
  # Example of regular route:
  get 'users/get_book/:id' => 'users#get_book', as: 'user_get_book'
  get 'books/show_book_list/:id' => 'books#show_book_list', as: 'show_available_books'
  get 'users/return_book/:id' => 'users#return_book', as: 'user_return_book'
  
  # Example of named route that can be invoked with purchase_url(id: product.id)
  #get 'books/show_book_list' => 'books#show_book_list'

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
