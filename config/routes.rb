Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
    root 'welcome#index'
    get '/auth/twitter', as: 'login'
    get '/auth/twitter/callback', to: 'sessions#create'
    get 'logout', to: 'sessions#destroy'
    get 'podcasts/search', to: 'podcasts#search'
    # get 'podcasts/edit', to: 'podcasts#edit'
    # post 'podcasts/create', to: 'podcasts#create'
    post 'podcasts/search_result', to: 'podcasts#search_result'
    get 'podcasts/search_result', to: 'podcasts#search_result'
    get 'playlists/selector', to: 'playlists#selector'

    get 'user/profile', to: 'users#show'

    resources :podcasts, only: [:new, :create, :destroy, :show]

    resources :playlists

    #or add to playlist would go to non-nested podcast new
    #then go to new form
    #that has dropdown of all current playlists
    #then you take the podcast Id with the params


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
