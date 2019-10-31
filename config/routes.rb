Rails.application.routes.draw do
  get 'uploads/create', to: 'uploads#create'
  get 'uploads/new'
  get 'uploads/show'
  get 'uploads/index'
  get 'reviews/index'
  get 'reviews/create'
  get 'reviews/new'
  get 'cab_configs/index'
  get 'cab_configs/show'
  get 'cab_configs/create'
  get 'cab_configs/new'
  get 'cab_configs/edit'
  get 'cab_configs/update'
  get 'collections/index'
  get 'collections/show'
  get 'collections/create'
  get 'collections/new'
  get 'collections/edit'
  get 'collections/update'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
