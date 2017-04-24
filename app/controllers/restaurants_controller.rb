class RestaurantsController < ApplicationController

  before_action :logged_in_restaurant, :correct_restaurant,   only: [:edit, :update]
  before_action :logged_in_user,:admin_user,  only: :destroy
  def new
  	@restaurant=Restaurant.new
  end

  def open_or_closed(restaurant)
   current_local_time=Time.new
    #local time zone - time zone in North York
    time_difference=current_local_time.utc_offset+5*3600
 if ("2017-03-13".."2017-11-05").include?(current_local_time.strftime("%Y-%m-%d"))
      time_difference=current_local_time.utc_offset+4*3600
end
     @current_time_NY=current_local_time-time_difference
    if @current_time_NY.wday==0 
      if  restaurant.hours_Saturday_end!=nil && restaurant.hours_Saturday!=nil
       if ((@current_time_NY.strftime("%H:%M"))..(restaurant.hours_Saturday.strftime("%H:%M"))).include?(restaurant.hours_Saturday_end.strftime("%H:%M"))
        restaurant.update!(is_open:"open")
       elsif restaurant.hours_Sunday!=nil &&restaurant.hours_Sunday_end!=nil && TimeRange.new(restaurant.hours_Sunday,restaurant.hours_Sunday_end).include?(@current_time_NY)
        restaurant.update!(is_open:"open")
       elsif restaurant.hours_Sunday!=nil &&restaurant.hours_Sunday_end!=nil
        restaurant.update!(is_open:"closed")
       end
      elsif restaurant.hours_Sunday==nil &&restaurant.hours_Sunday_end==nil
        restaurant.update!(is_open:"closed")
      end
    elsif @current_time_NY.wday==1 
      if restaurant.hours_Sunday_end!=nil && restaurant.hours_Sunday!=nil
       if ((@current_time_NY.strftime("%H:%M"))..(restaurant.hours_Sunday.strftime("%H:%M"))).include?(restaurant.hours_Sunday_end.strftime("%H:%M"))
        restaurant.update!(is_open:"open")
       elsif restaurant.hours_Monday!=nil && restaurant.hours_Monday_end!=nil && TimeRange.new(restaurant.hours_Monday,restaurant.hours_Monday_end).include?(@current_time_NY)
        restaurant.update!(is_open:"open")
       elsif restaurant.hours_Monday!=nil && restaurant.hours_Monday_end!=nil
        restaurant.update!(is_open:"closed")
       end
      elsif restaurant.hours_Monday==nil && restaurant.hours_Monday_end==nil
        restaurant.update!(is_open:"closed")
      end
    elsif @current_time_NY.wday==2
      if restaurant.hours_Monday_end!=nil && restaurant.hours_Monday!=nil
       if ((@current_time_NY.strftime("%H:%M"))..(restaurant.hours_Monday.strftime("%H:%M"))).include?(restaurant.hours_Monday_end.strftime("%H:%M"))
        restaurant.update!(is_open:"open")
       elsif restaurant.hours_Tuesday!=nil && restaurant.hours_Tuesday_end!=nil && TimeRange.new(restaurant.hours_Tuesday,restaurant.hours_Tuesday_end).include?(@current_time_NY)
        restaurant.update!(is_open:"open")
       elsif restaurant.hours_Tuesday!=nil && restaurant.hours_Tuesday_end!=nil
        restaurant.update!(is_open:"closed")
       end
      elsif restaurant.hours_Tuesday==nil && restaurant.hours_Tuesday_end==nil
        restaurant.update!(is_open:"closed")  
      end
    elsif @current_time_NY.wday==3 
      if restaurant.hours_Tuesday_end!=nil && restaurant.hours_Tuesday!=nil
       if ((@current_time_NY.strftime("%H:%M"))..(restaurant.hours_Tuesday.strftime("%H:%M"))).include?(restaurant.hours_Tuesday_end.strftime("%H:%M"))
        restaurant.update!(is_open:"open")
       elsif restaurant.hours_Wednesday!=nil && restaurant.hours_Wednesday_end!=nil && TimeRange.new(restaurant.hours_Wednesday,restaurant.hours_Wednesday_end).include?(@current_time_NY)
        restaurant.update!(is_open:"open")
       elsif restaurant.hours_Wednesday!=nil && restaurant.hours_Wednesday_end!=nil
        restaurant.update!(is_open:"closed")
       end
      elsif restaurant.hours_Wednesday==nil && restaurant.hours_Wednesday_end==nil
        restaurant.update!(is_open:"closed")          
      end
    elsif @current_time_NY.wday==4 
      if restaurant.hours_Wednesday_end!=nil && restaurant.hours_Wednesday!=nil
       if ((@current_time_NY.strftime("%H:%M"))..(restaurant.hours_Wednesday.strftime("%H:%M"))).include?(restaurant.hours_Wednesday_end.strftime("%H:%M"))
        restaurant.update!(is_open:"open")
       elsif restaurant.hours_Thursday!=nil && restaurant.hours_Thursday_end!=nil && TimeRange.new(restaurant.hours_Thursday,restaurant.hours_Thursday_end).include?(@current_time_NY)
        restaurant.update!(is_open:"open")
       elsif restaurant.hours_Thursday!=nil && restaurant.hours_Thursday_end!=nil
        restaurant.update!(is_open:"closed")
       end 
      elsif restaurant.hours_Thursday==nil && restaurant.hours_Thursday_end==nil
        restaurant.update!(is_open:"closed")        
      end
    elsif @current_time_NY.wday==5 
      if restaurant.hours_Thursday_end!=nil && restaurant.hours_Thursday!=nil
       if ((@current_time_NY.strftime("%H:%M"))..(restaurant.hours_Thursday.strftime("%H:%M"))).include?(restaurant.hours_Thursday_end.strftime("%H:%M"))
        restaurant.update!(is_open:"open")
       elsif restaurant.hours_Friday!=nil && restaurant.hours_Friday_end!=nil && TimeRange.new(restaurant.hours_Friday,restaurant.hours_Friday_end).include?(@current_time_NY)
        restaurant.update!(is_open:"open")
       elsif restaurant.hours_Friday!=nil && restaurant.hours_Friday_end!=nil
        restaurant.update!(is_open:"closed")
       end
      elsif restaurant.hours_Friday==nil && restaurant.hours_Friday_end==nil
        restaurant.update!(is_open:"closed")
      end
    elsif @current_time_NY.wday==6 
      if  restaurant.hours_Friday_end!=nil && restaurant.hours_Friday!=nil
       if ((@current_time_NY.strftime("%H:%M"))..(restaurant.hours_Friday.strftime("%H:%M"))).include?(restaurant.hours_Friday_end.strftime("%H:%M"))
        restaurant.update!(is_open:"open")
       elsif restaurant.hours_Saturday!=nil && restaurant.hours_Saturday_end!=nil && TimeRange.new(restaurant.hours_Saturday,restaurant.hours_Saturday_end).include?(@current_time_NY)
        restaurant.update!(is_open:"open")
       elsif restaurant.hours_Saturday!=nil && restaurant.hours_Saturday_end!=nil
        restaurant.update!(is_open:"closed")
       end
      elsif restaurant.hours_Saturday==nil && restaurant.hours_Saturday_end==nil
        restaurant.update!(is_open:"closed")
      end  
    end

    if restaurant.hours_Sunday==nil &&restaurant.hours_Sunday_end==nil && restaurant.hours_Monday==nil && restaurant.hours_Monday_end==nil && restaurant.hours_Tuesday==nil && restaurant.hours_Tuesday_end==nil && restaurant.hours_Wednesday==nil && restaurant.hours_Wednesday_end==nil && restaurant.hours_Thursday==nil && restaurant.hours_Thursday_end==nil && restaurant.hours_Friday==nil && restaurant.hours_Friday_end==nil && restaurant.hours_Saturday==nil && restaurant.hours_Saturday_end==nil
      restaurant.update!(is_open:"")
    end

    if restaurant.open24Hours== true
        restaurant.update!(is_open:"open")
    end
  end 

  def show
  	@restaurant = Restaurant.find(params[:id])
    open_or_closed(@restaurant)
     @reviews = @restaurant.reviews.paginate(page: params[:page])
  end

 def index
    @restaurants = Restaurant.paginate(page: params[:page])
    @restaurants.each do |restaurant|
     open_or_closed(restaurant)
   end
  end
 
  def create
    @restaurant = Restaurant.new(restaurant_params)
     
    if @restaurant.save
      restaurant_log_in @restaurant
      flash[:success] = "Successfuly signed up as a restaurant. Welcome to Find Restaurant App!"
      redirect_to @restaurant
    else
      render 'new'
    end
  end

  def edit
   
  end

  def search
    @restaurants = Restaurant.where("name OR categories LIKE ? ","%#{params[:name]}%").paginate(page: params[:page])
       @restaurants.each do |restaurant|
     open_or_closed(restaurant)
   end
  end

  def update
    if @restaurant.update_attributes(restaurant_params)
        flash[:success] = "Profile updated"
        redirect_to @restaurant
    else
      render 'edit'
    end
  end

  def destroy
    Restaurant.find(params[:id]).destroy
    flash[:success] = "Restaurant deleted"
    redirect_to restaurants_url
  end

    def restaurant_params
    params.require(:restaurant).permit(:name, :neighborhood, :address, :postal_code, :latitude, :longitude, :stars, :review_count, :is_open, :alcohol, :ambience_romantic, :ambience_intimate, :ambience_classy, :ambience_hipster, :ambience_touristy, :ambience_trendy, :ambience_upscale, :ambience_casual, :bikeParking, :businessAcceptsCreditCards, :businessParking_garage, :businessParking_street, :businessParking_validated, :businessParking_lot, :businessParking_valet, :caters, :goodForKids, :goodForMeal_dessert, :goodForMeal_latenight, :goodForMeal_lunch, :goodForMeal_dinner, :goodForMeal_breakfast, :goodForMeal_brunch, :hasTV, :noiseLevel, :open24Hours, :outdoorSeating, :restaurantsAttire, :restaurantsDelivery, :restaurantsGoodForGroups, :restaurantsPriceRange2, :restaurantsReservations, :restaurantsTableService, :restaurantsTakeOut, :wheelchairAccessible, :wiFi, :categories, :hours_Monday, :hours_Tuesday, :hours_Wednesday, :hours_Thursday, :hours_Friday, :hours_Saturday, :hours_Sunday, :hours_Monday_end, :hours_Tuesday_end, :hours_Wednesday_end, :hours_Thursday_end, :hours_Friday_end,:hours_Saturday_end, :hours_Sunday_end, :password, :password_confirmation)
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

def correct_restaurant
      @restaurant = Restaurant.find(params[:id])
      redirect_to(root_url) unless current_restaurant?(@restaurant)
end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
