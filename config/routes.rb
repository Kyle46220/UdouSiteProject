Rails.application.routes.draw do

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
   
  end

  resources 'collections' do 
    collection do
      get :public
    end
    collection do
      get :private
    end
  end
  


  get 'profiles', to: 'profiles#index', as: 'profiles'

  get 'profile', to: 'profiles#show', as: 'profile'

  get 'profiles/new', to: 'profiles#new', as: 'new_profile'

  post 'profiles', to: 'profiles#create'

  get 'profiles/edit', to: 'profiles#edit', as: 'edit_profile'

  put 'profile', to: 'profiles#update'
  patch 'profile', to: 'profiles#update'

  put 'collections/:id', to: 'collections#update'
  patch 'collections/:id', to: 'collections#update'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
