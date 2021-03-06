class GamesController < ApplicationController

  def index
    @games = Game.all.order(:title)
  end

  def show
    @game = Game.find_by(id: params[:id])
    @comments = @game.comments
  end

  def new
  	@types = Type.all
  end

  def create
  	@game = Game.new(game_params)

  	if @game.save
  		get_checked_types.each { |type| GameType.create(game: @game, type: type) }

  		redirect_to home_path
  	else
  		render 'new'
  	end
  end

  def upvote
    register_vote(1)
    redirect_to game_path(@game)
  end

  def downvote
    register_vote(-1)
    redirect_to game_path(@game)
  end


  private
  	def game_params
  		params.require(:game).permit(:title, :duration, :complexity, :players_min, :players_max)
  	end

  	def get_checked_types
  		types = []
  		params[:game][:type][0].each do |type|
  			if type[1] == '1'
  				types << Type.find_by_id(type[0])
  			end
  		end
  		return types
  	end

    def register_vote(new_value)
      @game = Game.find_by_id(params[:id])
      @vote = Vote.find_by(user: current_user, game: @game)
      
      if @vote
        @vote.update_attributes(value: new_value)
      else
        @game.votes.create(user: current_user, value: new_value)
      end
    end
end
