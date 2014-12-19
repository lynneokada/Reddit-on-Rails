Rails.application.routes.draw do
  root 'home#home'
  get 'users/new'
  get 'signup'                  => 'users#new'
  get 'account/edit'            => 'home#edit'
  get 'redditposts/:id'         => 'redditposts#show'
  get 'subreddits/new'          => 'subreddits#new'
  get 'subreddits/:id'          => 'subreddits#show'

  patch 'account/edit'          => 'home#update_account'

  post 'login'                  => 'sessions#create'
  post 'signup'                 => 'users#create'
  post 'redditpost/:id/comment' => 'comments#create'
  post 'subreddits/create'      => 'subreddits#create'

  delete 'logout'               => 'sessions#destroy'

  resources :users
  resources :redditposts, only: [:create, :destroy]
  resources :votes, only: [:create]
  resources :subreddits
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):

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
