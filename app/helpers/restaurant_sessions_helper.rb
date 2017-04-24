module RestaurantSessionsHelper

 def restaurant_log_in(restaurant)
    cookies.permanent[:remember_token] = restaurant.id
    self.current_restaurant = restaurant    
  end

  def restaurant_logged_in?
    !current_restaurant.nil?
  end

  def current_restaurant=(restaurant)
    @current_restaurant = restaurant    
  end

  def current_restaurant
    @current_restaurant ||= Restaurant.find_by(id: cookies[:remember_token])
  end

  def restaurant_log_out
  	self.current_restaurant = nil
  	cookies.delete(:remember_token)
  end

  def current_restaurant?(restaurant)
     restaurant == current_restaurant  	
  end


  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def store_location
    session[:forwarding_url] = request.url if request.get?
  end 
end
