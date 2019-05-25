class Station < ApplicationRecord
  validates :name, presence: true

  has_many :ways
  has_many :routes, through: :ways
  has_many :orders
  has_many :tickets, through: :orders

  scope :ordered, -> { joins(:ways).order("ways.position").uniq }

  def update_value(route, value, params_value)
    way = way(route)
    way.update(value => params_value) if way
  end

  def value_in_route(value, route)
    way(route).try(value)
  end

  protected

  def way(route)
    @way ||= ways.where(route: route).first
  end
end
