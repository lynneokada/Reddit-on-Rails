class HomeController < ApplicationController
  def home
    @user = User.new
  end
end
