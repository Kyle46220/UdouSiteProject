Rails.application.routes.draw do

  # get 'orders/index'
  # get 'orders/show'
  # get 'orders/new'
  # get 'cart_items/create'
  # get 'cart_items/update'
  # get 'cart_items/destroy'
  

  
  # get 'carts/new'
  # get 'carts/create'
  # get 'carts/edit'
  # get 'carts/update'
  # get 'carts/delete'
  # get 'carts/show'

  devise_for :users, controllers: { registrations: "registrations" }
  
  get '/', to: "pages#home", as: "root"
  # get 'pages/not_found'
  # get 'uploads/create', to: 'uploads#create'
  # get 'uploads/new'
  # get 'uploads/show'
  # get 'uploads/index'
  # get 'reviews/index'
  # get 'reviews/create'
  # get 'reviews/new'
  # get 'cab_configs/index'
  # get 'cab_configs/show'
  # get 'cab_configs/create'
  # get 'cab_configs/new'
  # get 'cab_configs/edit'
  # get 'cab_configs/update'
  # get 'collections/index'
  # get 'collections/show'
  # get 'collections/create'
  # get 'collections/new'
  # get 'collections/edit'
  # get 'collections/update'

  resources :cab_configs do
    collection do 
      get :collection
    end
    collection do 
      get :private_index
    end
   
  end

  resources 'collections' do 
    collection do
      get :public
    end
    collection do
      get :private
    end
  end

  resources :uploads

  
  


  get 'profiles', to: 'profiles#index', as: 'profiles'

  get 'profile', to: 'profiles#show', as: 'profile'

  get 'profiles/new', to: 'profiles#new', as: 'new_profile'

  post 'profiles', to: 'profiles#create'

  get 'profiles/edit', to: 'profiles#edit', as: 'edit_profile'

  put 'profile', to: 'profiles#update'
  patch 'profile', to: 'profiles#update'

  put 'collections/:id', to: 'collections#update'
  patch 'collections/:id', to: 'collections#update'

  
    # resources 'carts' do 
    #   resources 'cart_items' 
    # end

  # get 'carts/:id', to: "carts#show", as: "cart"
  delete 'carts/:id', to: "carts#destroy"
  get 'cart', to: "carts#show", as: "cart"

  post 'cart_items/:id/add', to: "cart_items#up_qty", as: "cart_item_up"
  post 'cart_items/:id/reduce', to: "cart_items#down_qty", as: "cart_item_down"
  post 'cart_items', to: "cart_items#create"
  # get 'cart_items', to: 
  get 'cart_items/:id', to: "cart_items#show", as: "cart_item"
  delete 'cart_items/:id', to: "cart_items#destroy"
  
  resources :orders

  get "/payments/success", to: "payments#success"
  

  

#   get 'line_items/:id' => "line_items#show", as: "line_item"
# delete 'line_items/:id' => "line_items#destroy"
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
