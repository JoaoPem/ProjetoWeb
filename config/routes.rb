Rails.application.routes.draw do
  namespace :site do
    get 'welcome/index'
  end
  namespace :users_backoffice do
    get 'welcome/index'
  end
  devise_for :users

  get 'inicio', to: 'site/welcome#index'
  root to: 'site/welcome#index'

  get 'cart', to: 'cart#index', as: 'cart'
  post 'add_item_to_cart', to: 'cart#add_item_to_cart', as: 'add_item_to_cart'
  post 'finalize_order', to: 'cart#finalize_order', as: 'finalize_order'
end
