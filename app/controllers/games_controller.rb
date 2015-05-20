class GamesController < ApplicationController

  def show
    @game = Game.find_by(params[:id])
  end

end
