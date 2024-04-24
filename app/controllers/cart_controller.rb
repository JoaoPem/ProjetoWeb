class CartController < ApplicationController
  before_action :load_cart

  def index
    @items = session[:cart].map do |product_id, quantity|
      product = Product.find_by(id: product_id)
      { product: product, quantity: quantity } if product
    end.compact  # This will remove any nil entries if a product isn't found
  end

  def add_item_to_cart
    product_id = params[:product_id]
    quantity = params.fetch(:quantity, 1).to_i
  
    session[:cart] ||= {}  # Ensure session[:cart] is a hash before trying to access it.
    session[:cart][product_id] = (session[:cart][product_id] || 0) + quantity
  
    flash[:notice] = 'Produto adicionado ao carrinho com sucesso!'
  
    redirect_to root_path, notice: 'Produto adicionado ao carrinho com sucesso!'
  end
  

  private

  def load_cart
    session[:cart] ||= {}
  end
end
