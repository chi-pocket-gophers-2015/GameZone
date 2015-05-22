Rails.application.routes.draw do
  # get 'welcome/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # get '/users/new' => 'users#new'
  # post '/users' => 'users#create'

  resources :users
  post '/users/:user_id/games/:game_id/ownerships' => 'ownerships#create', as: :ownerships
  delete '/ownerships/:id' => "ownerships#destroy", as: :remove_ownership

  get '/home' => 'users#home', as: :home

  get '/login' => 'sessions#new', as: :login
  post '/sessions/new' => 'sessions#create'
  delete '/logout' => 'sessions#destroy', as: :logout

  resources :types
  resources :games do 
    resources :comments, only: [:create, :destroy]
  end

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
