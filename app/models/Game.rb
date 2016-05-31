# A game record is our most important object, it belongs to many genres and consoles and it has many vote records
class Game < ActiveRecord::Base
    has_and_belongs_to_many :game_consoles
    has_and_belongs_to_many :game_genres
    has_many :vote_records
    validates_presence_of :name
    belongs_to :game_queue
end
