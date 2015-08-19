Rails.application.routes.draw do

  resources :profiles
  # devise_for :users
  get 'welcome/index'

  get 'reviews', to: 'reviews#index'
  post 'reviews', to: 'reviews#create'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}
  

  # get 'sessions/new'
  #
  # get 'sessions/create'
  #
  # get 'sessions/destroy'
  #
  # get 'welcome/index'


  #
  # get "/log-in" => "devise/sessions#new"
  # post "/log-in" => "devise/sessions#create"
  # get "/log-out" => "devise/sessions#destroy", as: :log_out



  #
  #
  # get 'reviews', to: 'reviews#index'
  # post 'reviews', to: 'reviews#create'

  resources :playlists do
    member do
      post 'upvote'
      post 'downvote'
      get 'confirmation'
    end
  end
  get 'playlists', to: 'playlists#index', page: 1
  get 'playlists/page/:page', to: 'playlists#index'

  root to: 'welcome#index'


  get 'facebook/token'

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
