class OwnershipsController < ApplicationController

  def create
    # puts "Param"
    # p params
    # puts "Game"
    # p game
    # puts "@Game"
    # p @game
    game = Game.find_by_id(params[:game_id])
    user = User.find_by_id(params[:user_id])
    Ownership.create(game: game, user: user)
    redirect_to games_path
  end
end
