# A vote record belongs to a single game, which will have many of them
class VoteRecord < ActiveRecord::Base
    belongs_to :game
end
