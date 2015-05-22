class OwnershipsController < ApplicationController

  def create
    # game = Game.find_by_id(params[:game_id])
    # user = User.find_by_id(params[:user_id])
    # @ownership = Ownership.create(game: game, user: user)
    @ownership = Ownership.create(game_id: params[:game_id], user_id: params[:user_id])
    redirect_to(:back)
    # games_path
  end

  def destroy
    Ownership.find(params[:id]).destroy
    redirect_to(:back)
  end

end
