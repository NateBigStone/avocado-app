class SessionsController < ApplicationController
  def new 
  end
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/"
    else
      flash[:warning] = "Error Logging In"
      redirect_to '/login'
    end
  end
  def destroy
    session[:user_id] = nil
    flash[:success] = "Successfully Logged Out"
    redirect_to '/'
  end
end
