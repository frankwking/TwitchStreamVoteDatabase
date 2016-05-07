# A Queue is a list of Games
class GameQueue < ActiveRecord::Base
  has_many :Games
  validates_presence_of :name
end

# A Game is a record of a videogame to be played
class Game < ActiveRecord::Base
  has_and_belongs_to_many :game_queues
  validates_presence_of :name
end
