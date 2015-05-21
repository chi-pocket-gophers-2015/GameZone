class Game < ActiveRecord::Base
  has_many :ownerships
  has_many :votes
  has_many :comments
  has_many :game_types
  has_many :types, through: :game_types
  has_many :users, through: :ownerships
end
