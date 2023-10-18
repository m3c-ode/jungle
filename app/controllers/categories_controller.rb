class CategoriesController < ApplicationController

  def show
    # raise "Checking something"
    @category = Category.find(params[:id])
    # raise @category.inspect
    @products = @category.products.order(created_at: :desc)
  end

end
