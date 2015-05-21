module GamesHelper

  def check_players(game)
    game.players_min == game.players_max
  end

  def duration(game)
    game.duration < 60 ? "#{game.duration} min." : pluralize(game.duration/60, "hour")
  end
end
