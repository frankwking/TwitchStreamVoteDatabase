# A game genre has many games and many games have the same genre
class GameGenre < ActiveRecord::Base
    has_and_belongs_to_many :games
    validates_presence_of :name
end
