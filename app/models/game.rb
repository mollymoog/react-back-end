class Game < ApplicationRecord
    has_many :teams
    has_many :images

    accepts_nested_attributes_for :images
    accepts_nested_attributes_for :teams
end
