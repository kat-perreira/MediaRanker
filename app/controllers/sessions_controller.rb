class SessionsController < ApplicationController

  def new
  end

  def create
    name = params[:username]
    user = User.new(username: name)
    user.save

    if user
      flash[:success] = "Successfully logged in"
      session[:user_id] = user.id
      redirect_to root_path

    else
      render :new

    end
  end

  def logout
    session[:user_id] = nil
    flash[:success] = "You are logged out"
    redirect_to root_path
  end
end
