module GamesHelper

  def check_players(game)
    game.players_min == game.players_max
  end

  def duration(game)
    game.duration < 60 ? "#{game.duration} min." : pluralize(game.duration/60, "hour")
  end

  def i_own?(game)
    if current_user.games.include?(game)
      "Already own!"
    else
      button_to("I own this!", ownerships_path(current_user, game))
    end
  end

  def friends_own?(game)
    owners = game.users
    owners.map { |owner| owner.username }.join(", ")
  end

end
