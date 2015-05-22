module GamesHelper

  def check_players(game)
    game.players_min == game.players_max
  end

  def duration(game)
    game.duration < 60 ? "#{game.duration} min." : pluralize(game.duration/60, "hour")
  end

  def i_own?(game)
    if current_user.games.include?(game)
      old_game = Ownership.where(user: current_user, game: game)[0]

      button_to("Fuck this game", remove_ownership_path(old_game), method: :delete)
    else
      button_to("I own this!", ownerships_path(current_user, game))
    end
  end

  def friends_own?(game)
    owners = game.users
    owners.map { |owner| owner.username }.join(", ")
  end

end
