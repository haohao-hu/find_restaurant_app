module SessionsHelper
  def log_in(user)
  	cookies.permanent[:remember_token] = user.id
  	self.current_user = user  	
  end

  def logged_in?
  	!current_user.nil?
  end

  def current_user=(user)
  	@current_user = user  	
  end

  def current_user
  	@current_user ||= User.find_by(id: cookies[:remember_token])
  end

 

  def log_out
  	 self.current_user = nil
  	 cookies.delete(:remember_token)
  end

  def current_user?(user)
    user == current_user    
  end


  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def store_location
    session[:forwarding_url] = request.url if request.get?
  end  
end
