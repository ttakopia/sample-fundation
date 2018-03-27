class SessionsController < ApplicationController
  def new
  end

  def create

  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
      if user.activated?
    	 log_in user
       params[:session][:remember_me] == '1' ? remember(user) : forget(user)
  	   flash[:prymary] = "You are now logged in"
       redirect_to user
  	else
      message = 'Account not activated!'
      message += 'Check your email for an activation link'
      flash[:alert] = message
      redirect_to root_url
    end
  else
  		flash.now[:alert] = 'Invalid credentials, Please try again!'
  		render 'new'
  	end
  end

  def destroy
  	log_out if logged_in?
  	flash[:prymary] = 'Bye. See you soon'
  	redirect_to root_path
  end
end
