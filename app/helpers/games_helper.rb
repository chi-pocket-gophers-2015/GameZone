module GamesHelper

  def check_players(game)
    game.players_min == game.players_max
  end

  def duration(game)
    game.duration < 60 ? "#{game.duration} min." : pluralize(game.duration/60, "hour")
  end

  def i_own?(game)
    if current_user.games.include?(game)

    else
      <td></td>
    end
  end

  def friends_own?
    if :friends_own
  end

end
