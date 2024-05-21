Rails.application.routes.draw do
  # Namespace para o backoffice do usuário
  namespace :users_backoffice do
    # Rotas específicas para o backoffice do usuário
    get 'welcome/index'
    # Defina corretamente a rota para confirmar o pedido dentro do namespace
    post 'confirm_order', to: 'orders#confirm', as: 'confirm_order'
  end

  # Namespace para páginas públicas do site
  namespace :site do
    get 'welcome/index'
  end

  # Configurações de autenticação com Devise
  devise_for :users

  # Rota de início do site
  get 'inicio', to: 'site/welcome#index'
  # Rota raiz do site
  root to: 'site/welcome#index'

  # Rotas para funcionalidades do carrinho
  get 'cart', to: 'cart#index', as: 'cart'
  post 'add_item_to_cart', to: 'cart#add_item_to_cart', as: 'add_item_to_cart'
  post 'finalize_order', to: 'cart#finalize_order', as: 'finalize_order'
end
