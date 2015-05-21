class UsersController < ApplicationController

	def home
		@user_games = current_user.games
		@user_friends = User.where.not(id: session[:user_id])
	end


	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			session[:user_id] = @user.id
			redirect_to home_path
		else
			render 'form'
		end
	end

	private
		def user_params
			params.require(:user).permit(:username, :password)
		end
end
