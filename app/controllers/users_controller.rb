class UsersController < ApplicationController 
	before_action :authenticate_user!
	def show 
		@user = User.find(params[:id])
		@projects = @user.projects
		@groups = @user.groups
		#@contacts = @user.contacts
	end 

	def new 
		@user = User.new(sign_up_params)
	end 

	def create
		@user = User.create(user_params)
	end 

	def edit 
		@user = User.find(params[:id])
	end 

	def update 
		@user = User.find(params[:id])
		@user.update_attributes(account_update_params)
	end 

	def manage 
		@user = User.find(params[:id])
	end 

	private 

	def user_params 
		params.require(:user).permit(:name, :job, :location, :mobile, :email)
	end 

end 