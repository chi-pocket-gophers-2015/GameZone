require 'CSV'

CSV.table("db/csv/games.csv").each do |game|
  Game.create!(game.to_hash)
end

CSV.table("db/csv/types.csv").each do |type|
  Type.create!(type.to_hash)
end

# User.create!(username: "brang", password: "brang")
# User.create!(username: "nathan", password: "nathan")
# User.create!(username: "natty", password: "natty")
# User.create!(username: "shannon", password: "shannon")
