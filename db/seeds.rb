require 'csv'

CSV.table("db/csv/games.csv").each do |game|
  Game.create!(game.to_hash)
end

CSV.table("db/csv/types.csv").each do |type|
  Type.create!(type.to_hash)
end

CSV.table("db/csv/game_types.csv").each do |game_type|
	game_object = Game.find_by_title(game_type[:game])
  types = game_type[:type].split(",")
  types.each do |type|
    type_object = Type.find_by_phrase(type)
    GameType.create!(game: game_object, type: type_object)
  end
end


User.create!(username: "brang", password: "brang")
User.create!(username: "nathan", password: "nathan")
User.create!(username: "natty", password: "natty")
User.create!(username: "shannon", password: "shannon")
User.create!(username: "lucas", password: "lucas")
User.create!(username: "casey", password: "casey")
User.create!(username: "penelope", password: "penelope")

all_games = Game.all
User.all.each do |user|
	all_games = Game.all.shuffle
	rand(5..20).times do
		Ownership.create!(user: user, game: all_games.pop)
	end
end

Game.all.each do |game|
	all_users = User.all.shuffle
	rand(5).times do
		rand > 0.4 ? value = 1 : value = -1
		Vote.create!(game: game, user: all_users.pop, value: value)
	end
end


