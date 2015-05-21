class OwnershipsController < ApplicationController

  def create
    game = Game.find_by_id(params[:game_id])
    user = User.find_by_id(params[:user_id])
    Ownership.create(game: game, user: user)
    redirect_to games_path
  end

  def destroy
    Ownership.find(params[:id]).destroy
    redirect_to(:back)
  end


end
