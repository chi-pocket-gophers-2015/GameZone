class UsersController < ApplicationController


	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			redirect_to homepage_path
		else 
			render 'form'
		end
	end

	private
		def user_params
			params.require(:user).permit(:username, :password)
		end
end
