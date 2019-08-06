class Sesh < ApplicationRecord
    belongs_to :user
    has_one :game
    
    attr_accessor :diff_id
end
