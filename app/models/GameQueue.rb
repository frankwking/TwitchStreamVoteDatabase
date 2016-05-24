# A game queue record has many games, which each belong to one queue
class GameQueue < ActiveRecord::Base
  has_many :games
end
