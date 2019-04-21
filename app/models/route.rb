class Route < ApplicationRecord
  validates :name, presence: true

  has_many :trains
  has_many :ways
  has_many :stations, through: :ways

  # accepts_nested_attributes_for :ways
end
