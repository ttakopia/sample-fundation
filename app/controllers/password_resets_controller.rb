class PasswordResetsController < ApplicationController
  

  
  def new
  end

  def create
  	@user = User.find_by(email: params[:password_reset][:email].downcase)
  	if @user
  		@user.create_reset_digest
  		@user.send_password_reset_email
  		flash[:primary] = 'Email sent with password reset instructions'
  		redirect_to root_path
  	else
  		flash.now[:alert] = 'Email address not found'
  		render 'new'
  	end
  end

  def edit
    get_user
    valid_user
    check_expiration
  end

  def update
    get_user
    valid_user
    check_expiration

    if params[:user][:password].empty?        # Case 3
      @user.errors.add(:password, "can not be empty")
      render 'edit'
    elsif @user.update_attributes(user_params) # Case 4
      log_in @user
      flash[:success] = 'Your password has been reset'
      redirect_to @user
    else                                       # Case 2
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def get_user
    @user = User.find_by(email: params[:email])
  end

  def valid_user
    unless @user && @user.activated? && @user.authenticated?(:reset, params[:id])
      redirect_to root_url
  end
end

  def check_expiration                        # Case 1
    if @user.password_reset_expired?
      flash[:alert] = 'Your password has expired'
      redirect_to new_password_reset_url
    end
  end

end
