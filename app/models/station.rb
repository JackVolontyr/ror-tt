class Station < ApplicationRecord
  validates :name, presence: true

  has_many :ways
  has_many :routes, through: :ways
  has_many :orders
  has_many :tickets, through: :orders

  scope :ordered, -> { joins(:ways).order("ways.position").uniq }

  def update_position(route, position)
    way = way(route)
    way.update(position: position) if way
  end

  def position_in(route)
    way(route).try(:position)
  end

  protected

  def way(route)
    @way ||= ways.where(route: route).first
  end
end
