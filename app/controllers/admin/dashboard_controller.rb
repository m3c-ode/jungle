class Admin::DashboardController < ApplicationController
  # http_basic_authenticate_with name: ENV["ADMIN_USR"], password: ENV["ADMIN_PWD"]

  def show
    @products = Product.all
    @categories = Category.all
  end
end
