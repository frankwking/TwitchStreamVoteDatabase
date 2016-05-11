# A game console has many game and many games have the same console
class GameConsole < ActiveRecord::Base
    has_and_belongs_to_many :games
    validates_presence_of :name
end

# A game genre has many games and many games have the same genre
class GameGenre < ActiveRecord::Base
    has_and_belongs_to_many :games
    validates_presence_of :name

end

# A vote record belongs to a single game, which will have many of them
class VoteRecord < ActiveRecord::Base
    belongs_to :game
end

# A game record is our most important object, it belongs to many genres and consoles and it has many vote records
class Game < ActiveRecord::Base
    has_and_belongs_to_many :game_consoles
    has_and_belongs_to_many :game_genres
    has_many :vote_records
    validates_presence_of :name
end
