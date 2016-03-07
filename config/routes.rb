Rails.application.routes.draw do

  post '/rate' => 'rater#create', :as => 'rate'


  root 'shops#useless'
  resources :shops do
    resources :barbers, shallow: true
  end

  resources :customers do
    member do
      get :following, :followers
    end
  end
  # resources :barbers do
  #   member do
  #     get :following, :followers
  #   end
  # end
  resources :relationships, only: [:create, :destroy]


#this is used to direct login Sessions
get '/login' => 'sessions#new'
post '/login' => 'sessions#create_customer'
get '/logout' => 'sessions#destroy_customer'
#this is used to direct login Sessions
post '/login' => 'sessions#create_barber'
get '/logout_barber' => 'sessions#destroy_barber'

post '/login' => 'sessions#create_shop'
get '/logout_shop' => 'sessions#destroy_shop'

#this is used for login purposes
  get '/signup_customer' => 'customers#new'
  post '/customers' => 'customers#create'

  get '/signup_barber' => 'barbers#new'
  post '/barbers' => 'barbers#create'

  get '/signup_shop' => 'shops#new'
  post '/shops' => 'shop#create'

  # get '/barbers/:id/delete' => 'barbers#destroy', as: 'delete'
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
