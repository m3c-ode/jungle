class Admin::SalesController < Admin::BaseController
  def index
    # render :index
     @sales = Sale.all
  end
end
