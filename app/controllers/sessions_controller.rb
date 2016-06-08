class SessionsController < ApplicationController

  def index

  end


  def welcome

  end

  def new
    @user = User.new

  end


  
  def create

    session[:user_id] = params[:user][:id]
    

    redirect_to user_path(params[:user][:id])
  end



  



  def destroy
    if session[:user_id]
      session.clear
      redirect_to root_path
    end


  end


end