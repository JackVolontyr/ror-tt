class Carriage < ApplicationRecord
  serialize :seats, JSON
  belongs_to :train, optional: true

  validates :number, :bottom_seats, presence: true
  validates_presence_of :top_seats, unless: :luxury_or_seat?
  validates_uniqueness_of :number

  def luxury_or_seat?
    self.class.name == 'CarriageLuxury' || self.class.name == 'CarriageSeat'
  end
end
