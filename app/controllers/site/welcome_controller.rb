class Site::WelcomeController < ApplicationController
  before_action :set_order

  def index
    @processors = Product.where(category_id: 1)
  end

  private

  def set_order
    @order = current_order
  end

  def current_order
    # Se o usuário está logado, buscar ou criar um pedido com status 'open'
    if user_signed_in?
      order = Order.find_or_create_by(user_id: current_user.id, status: 'open')
    else
      # Se não está logado, pode-se escolher criar um pedido temporário na sessão
      order = Order.find_by(id: session[:order_id], status: 'open')
      unless order
        order = Order.new(status: 'open')
        session[:order] = order
      end
    end
    order
  end
end
