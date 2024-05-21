class UsersBackoffice::WelcomeController < UsersBackofficeController
  before_action :load_cart_items

  def index
    load_cart_items
  end

  private

  def load_cart_items
    if session[:cart].present?
      cart_items_ids = session[:cart].keys
      @cart_items = Product.find(cart_items_ids)
    else
      @cart_items = []
    end
  end
end
  