class GameType < ActiveRecord::Base
  belongs_to :game
  belongs_to :type
end
