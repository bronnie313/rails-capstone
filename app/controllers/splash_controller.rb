class SplashController < ApplicationController
  skip_before_action :authenticate_user!, only: [:splash]
  def home
    render 'splash/home'
  end
end
