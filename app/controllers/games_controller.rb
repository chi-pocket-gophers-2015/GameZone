class GamesController < ApplicationController

  def index
    @type = Type.find_by(id: params[:type_id])
    @games = @type.games
  end

  def show
    @game = Game.find_by(id: params[:id])
  end

end
