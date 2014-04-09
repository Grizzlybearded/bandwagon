Bandwagon::Application.routes.draw do
  devise_for :users
  #get "categories/:id", to: 'categories#show'
  #get "categories/new"
  #get "categories/update"
  #get "categories/create"
  #get "categories/edit"
  #get "categories/delete"
  get "static_pages/home"  
  get "static_pages/test"
  get "static_pages/eblast"

  #The following commented out routes don't work
  #get ':categories', to: 'categories#index', as: :archive
  #get 'categories/:id', to: 'categories#show', as: 'digest'
  #get 'categories/:id', to: 'categories#show', as: :digest

  match '/collectemails/unsubscribe/:unsubscribe_token' => 'collectemails#unsubscribe', as: 'unsubscribe', via: [:get, :post]

  root to: 'static_pages#home'

  resources :blurbs, only: [:create, :destroy, :update, :edit]
  resources :categories, only: [:show, :create, :destroy, :update, :edit, :new, :index]
  resources :collectemails, only: [:create]

  #resources :categories
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
