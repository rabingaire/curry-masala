Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  get 'order_items/create'

  get 'order_items/update'

  get 'order_items/destroy'

  get 'carts/show'

  # resources :carts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :menus do
  	collection do
    	get 'home'
    	get 'list'
  	end
  end
  resource :cart do
    get 'checkout'
    get 'update_user'
  end
  resources :order_items, only: [:create, :update, :destroy]
  # resources :orders
 
  resources :categories
  root :to => 'menus#home'
end
