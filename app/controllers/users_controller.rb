class UsersController < ApplicationController


  def index

  end

  def new
    @user = User.new

  end

  def create
   
    user = User.new(user_params)
    user.save
    session[:user_id] = user.id
    redirect_to user
  end

  def show
    @user = current_user

    if @user
       unless @user == current_user || current_user.admin
         redirect_to root_path, notice: "Access denied."
       end
     else
       redirect_to root_path, notice: "Access denied."
     end

  end

  def ride
    @user = User.find(params[:id])
    ride = Ride.new(attraction_id: params[:attraction_id].to_i, user_id: params[:id].to_i)
    flash[:message] = ride.take_ride
 
    redirect_to @user

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    @user.save

    redirect_to @user

  end

  private 


  def user_params
  params.require(:user).permit(:name, :email, :password, :height, :happiness, :nausea, :tickets, :admin)
  end
  


end