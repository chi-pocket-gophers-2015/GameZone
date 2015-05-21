class GamesController < ApplicationController

  def index
    @type = Type.find_by(id: params[:type_id])
    @games = @type.games
  end

  def show
    @game = Game.find_by(id: params[:id])
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
end
