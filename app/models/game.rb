class Game < ActiveRecord::Base
  has_many :ownerships
  has_many :votes
  has_many :comments
  has_many :game_types
  has_many :types, through: :game_types
  has_many :users, through: :ownerships

  def score
  	# score = votes.pluck(:value).inject(:+)
  	# if score
  	# 	return score
  	# else
  	# 	return 0
  	# end

  	score = votes.pluck(:value).inject(:+) 
  	score ? (return score) : (return 0)
  end
end
