class Admin::BaseController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_USR"], password: ENV["ADMIN_PWD"]


end