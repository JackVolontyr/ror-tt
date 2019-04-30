class Route < ApplicationRecord
  validates :name, presence: true

  has_many :trains
  has_many :ways
  has_many :stations, through: :ways

  before_validation :auto_naming

  protected

  def auto_naming
    if stations.present?
      self[:name] = "#{get_first_station.name} -> #{get_last_station.name}"
    else
      self[:name] = "Станции не выбраны"
    end
  end

  def get_first_station
    stations.ordered.first
  end

  def get_last_station
    stations.ordered.last
  end
end
