class UsersBackoffice::WelcomeController < UsersBackofficeController
  
  #before_action :load_cart

  def index
  end
  
  # def show
  #   if session[:cart].present?
  #     cart_items_ids = session[:cart].keys
  #     @cart_items = Product.find(cart_items_ids)
  #   else
  #     @cart_items = []
  #   end
  # end

end
