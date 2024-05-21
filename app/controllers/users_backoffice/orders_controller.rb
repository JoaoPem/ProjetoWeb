module UsersBackoffice
  class OrdersController < ApplicationController
    before_action :authenticate_user!

    def confirm
      @order = current_user.orders.build
      build_order_from_session

      if @order.save
        # Limpa a sessão do carrinho após salvar o pedido com sucesso
        session[:cart].clear
        flash[:notice] = 'Pedido confirmado com sucesso!'
        # Permanece na página do carrinho
        redirect_back(fallback_location: users_backoffice_welcome_index_path)
        puts "OK"
      else
        # Em caso de falha, redireciona para o menu inicial com uma mensagem de erro
        flash[:alert] = 'Não foi possível completar seu pedido: ' + @order.errors.full_messages.to_sentence
        redirect_to root_path
        puts "FAIL"
      end
    end
  
    private

    def build_order_from_session
      # Supondo que você tem ids de produtos e quantidades em session[:cart]
      session[:cart].each do |product_id, quantity|
        product = Product.find(product_id)
        # Adiciona produto ao pedido
        @order.order_items.build(product: product, quantity: quantity)
      end
    end
    
  end
end
