class UsersController < ApplicationController

before_action :logged_in_user, only: [:index, :edit, :update]
before_action :correct_user, only: [:edit, :update]


def index
	@users = User.paginate(page: params[:page]).order('last_name ASC')
end

def show
	@user = User.find(params[:id])
end

def new
	@user = User.new
end

def create
	@user = User.new(user_params)
	if @user.save
		log_in(@user)
		flash[:success] = 'User created successfully'
		redirect_to @user
	else
		render 'new'
	end
end

def edit
	@user = User.find(params[:id])
end

def update
	@user = User.find(params[:id])
	if @user.update_attributes(user_params)
	 flash[:success] = 'Profile updated successfully'
	 redirect_to @user
	else
		render 'edit'
	end
end

private

	def user_params
		params.require(:user).permit(:first_name,:last_name,:email,:password,:password_confirmation)
	end

	def logged_in_user
		unless logged_in?
			flash[:alert] = 'Please log in'
			redirect_to login_url
		end
	end

	def correct_user
		@user = User.find(params[:id])
		redirect_to root_url unless @user == current_user
	end
end

