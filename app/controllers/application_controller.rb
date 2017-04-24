class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include RestaurantSessionsHelper
    def logged_in_user
     unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
     end
  end

    def logged_in_restaurant
    unless restaurant_logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to restaurant_login_url
    end
  end

    def logged_in_restaurant_or_user
    unless restaurant_logged_in?||logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to root_url
    end
  end

end
