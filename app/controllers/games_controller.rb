class GamesController < ApplicationController

  def index
    @type = Type.find_by(id: params[:type_id])
    game_type = Game_type.find_by(type: @type)
    @games = Game.find_by(game_type: game_type)
  end

  def show
    @game = Game.find_by(id: params[:id])
  end

end
