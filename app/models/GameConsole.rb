# A game console has many game and many games have the same console
class GameConsole < ActiveRecord::Base
    has_and_belongs_to_many :games
    validates_presence_of :name
end
