class RestaurantSessionsController < ApplicationController
  def new
  end

  def create
  	    restaurant = Restaurant.find_by(name: params[:name], postal_code: params[:postal_code])
  	   
    if restaurant && restaurant.authenticate(params[:password])
      restaurant_log_in restaurant
      redirect_back_or restaurant
    else
      flash.now[:danger] = 'Invalid name/postal code/password combination'
      render 'new'
    end
  end

  def destroy
  	restaurant_log_out
  	redirect_to root_url
  end


end
