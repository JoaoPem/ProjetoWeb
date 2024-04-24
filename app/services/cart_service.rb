class CartService
  def initilize(session)
    @session = session
    @session[:cart] || = {}
  end

  def add_item(item_id)
    @session[:cart][item_id] = (@session[:cart][item_id] || 0) + 1
  end

  def remove_item(item_id)
    @session[:cart].delete(item_id) if @session[:cart][item_id]
  end

  def clear
    @session[:cart]  = {}
  end
  
end