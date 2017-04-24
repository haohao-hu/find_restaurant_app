class ReviewsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  before_action :calculate_average_stars,   only: :create  
  after_action :calculate_average_stars, only: [:create,:destroy]  
def calculate_average_stars
 	total=0
 	 current_user.reviews.each do |review| total=total+review.stars end
    if current_user.reviews.count!=0
      astars=total/(current_user.reviews.count)        
      else
        astars=0
      end 
      pword=current_user.password
    current_user.update!(average_stars: astars)
 end

  def create
  	 @review = current_user.reviews.build(review_params)
    if @review.save
      flash[:success] = "Review posted!"
      #astars=(@review.stars+current_user.average_stars*(current_user.reviews.count-1))/(current_user.reviews.count)
      #current_user.update!(average_stars: astars)
      count=@review.restaurant.reviews.count
      stars=(@review.restaurant.stars*(count-1)+@review.stars)/count
      @review.restaurant.update!(review_count: count)
      @review.restaurant.update!(stars: stars)
      redirect_to @review.restaurant
    else
    	 @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
  	@review.destroy
    count=@review.restaurant.reviews.count
    @review.restaurant.update!(review_count: count)
    stars=(@review.restaurant.stars*(count+1)-@review.stars)/count
  	@review.restaurant.update!(stars: stars)
    flash[:success] = "Review deleted"
    redirect_to request.referrer || root_url
  end

  def review_params
  	params.require(:review).permit(:text,:stars, :restaurant_id)
  end

  def correct_user
  	@review = current_user.reviews.find_by(id: params[:id])
  	redirect_to root_url if @review.nil?
  end
end