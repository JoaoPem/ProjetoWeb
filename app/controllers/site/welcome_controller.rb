class Site::WelcomeController < SiteController
  def index
    @processors = Product.where(category_id: 1)
  end
end
