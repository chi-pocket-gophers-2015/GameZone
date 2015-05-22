class VotesController < ApplicationController

	def upvote
		register_vote(1)
		redirect_to game_path(@game)
	end

	def downvote
		register_vote(-1)
		redirect_to game_path(@game)
	end

	private
		def register_vote(new_value)
			@game = Game.find_by_id(params[:game_id])
			@vote = Vote.where(user: current_user, game: @game)

			if @vote
				@vote.value = new_value
			else
				@game.votes.new(user: current_user, value: new_value)
			end
		end
end
