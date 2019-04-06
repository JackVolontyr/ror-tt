class Route < ApplicationRecord
  validates :name, presence: true
  has_many :trains
  has_and_belongs_to_many :stations
end
