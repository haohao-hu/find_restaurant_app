class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  #before_action :calculate_average_stars,    only: :show
  def calculate_average_stars
    @users = User.all
  
  @users.each do |user|
    total=0
   user.reviews.each do |review| total=total+review.stars end
    if user.reviews.count!=0
      astars=total/(user.reviews.count)        
      else
        astars=nil
      end 
    user.update!(average_stars: astars)

  end
 end

  def new
  	 @user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		log_in @user
  		flash[:success] = "Welcome to Find Restaurant App!"
  		redirect_to @user
  	 else
  	 	render 'new'
  	 end
  end

  def user_params
  	params.require(:user).permit(:name, :email, :password, 
  		:password_confirmation, :average_stars)
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
  	 @user = User.find(params[:id])
     @reviews = @user.reviews.paginate(page: params[:page])
  end

  def edit
  
  end

  def update
  	if @user.update_attributes(user_params)
       flash[:success] ="User profile updated"
       redirect_to @user  		
  	  else
  	  	render 'edit'
  	  end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url    
  end



  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
