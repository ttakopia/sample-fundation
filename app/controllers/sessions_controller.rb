class SessionsController < ApplicationController
  def new
  end

  def create

  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  	 log_in user
  	 redirect_to user
  	 flash[:prymary] = "You are now logged in"
  	else
  		flash.now[:alert] = 'Invalid credentials, Please try again'
  		render 'new'
  	end
  end

  def destroy
  	log_out
  	flash[:prymary] = 'Bye. See you soon'
  	redirect_to root_path
  end
end
