class Team < ApplicationRecord
  belongs_to :game
  has_many :images
end
