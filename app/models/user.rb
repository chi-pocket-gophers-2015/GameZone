class User < ActiveRecord::Base
  has_many :ownerships
  has_many :votes
  has_many :comments
  has_many :games, through: :ownerships
  has_secure_password

end
