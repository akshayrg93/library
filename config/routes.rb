require 'resque/server'
require 'resque/scheduler/server'

Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  resources :users do
    collection do
      put :get_book
    end
  end
  
  resources :books do
    get :autocomplete_book_name, :on => :collection
  end

  resources :user_sessions

  mount Resque::Server.new, at: "/resque"

  # You can have the root of your site routed with "root"
  root 'home#index'
  match 'login' => 'user_sessions#new', :as => :login, via: [:get, :post]
  match 'logout' => 'user_sessions#destroy', :as => :logout, via: [:get, :post]
  match 'admin_home' => 'home#admin_home', :as => :admin_home, via: [:get, :post]
  # Example of regular route:
  #get 'users/get_book/:id' => 'users#get_book', as: 'user_get_book'
  get 'books/show_book_list/:id' => 'books#show_book_list', as: 'show_available_books'
  get 'users/return_book/:id' => 'users#return_book', as: 'user_return_book'
  get 'users/buy_book/:id' => 'users#buy_book', as: 'user_buy_book'
  get 'books/buy_selected_books/:id' => 'books#buy_selected_books', as: 'buy_selected_books'
  get 'books/payment/:id1/:id2' => 'books#payment', as: 'payment'
  
  post 'users/activate_user/:id' => 'users#activate_user', as: 'activate_user'
  post 'users/deactivate_user/:id' => 'users#deactivate_user', as: 'deactivate_user'
  # Example of named route that can be invoked with purchase_url(id: product.id)
  #get 'books/show_book_list' => 'books#show_book_list'

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  
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