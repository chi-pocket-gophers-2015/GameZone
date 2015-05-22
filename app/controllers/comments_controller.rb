class CommentsController < ApplicationController

	def create
		game = Game.find_by_id(params[:game_id])
		@comment = Comment.new(comment_params)

		current_user.comments << @comment
		game.comments << @comment

		if @comment.save
			redirect_to game_path(game)
		else
			#TODO catch errors and display to user
			redirect_to game_path(game)
		end
	end

	def destroy
		game = Game.find_by_id(params[:game_id])
		Comment.find_by_id(params[:id]).destroy

		redirect_to game_path(game)
	end

	private
		def comment_params
			params.require(:comment).permit(:body)
		end
end
