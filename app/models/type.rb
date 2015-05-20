class Type < ActiveRecord::Base
  has_many :game_types
  has_many :games, through: :game_types
end
