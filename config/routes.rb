Rails.application.routes.draw do

  get 'events/show'

  get 'sessions/login'

  root 'users#index'
  post 'users' => 'users#create'
  get 'users/edit'
  get 'user/:id' => 'users#edit'
  patch 'users/:id' => 'users#update'
  get '/events' => 'events#index'
  post '/events' => 'events#create'
  post '/events/:id' => 'events#edit'
 patch '/events/:id' => 'events#update'
  delete '/events/:id' => 'events#delete'
  post '/login' => 'users#login'
  get 'events/:id' => 'events#show'
  delete '/join/:id' => 'events#unjoin'
  post 'join/:id' => 'events#join'
  post 'comment/:id' => 'events#addcomment'
  get 'users/show'

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
