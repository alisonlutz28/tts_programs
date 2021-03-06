class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :categories
  before_filger :brands

  def categories
  	@categories = Category.all
  end

  def brands
  	@brands = []
  	Product.all.each do |product|
  		if @brands.include?(product.brand) == false
  			@brands.push(product.brand)
  		end
  	end
  	return @brands
  end
end
