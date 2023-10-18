class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    # puts "In Product show"
    
    # Implicit in Rails. Automatically renders the action result. Goes into the yield of layout/application
    # render :show #or 'show'
    # 
    #If we were to want to render another path, could do with the string such as
    #render 'shared/show"
    #
    #Any other instance variabale will be sent to the view template to use
    
  end

end
