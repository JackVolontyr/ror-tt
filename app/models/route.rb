class Route < ApplicationRecord
  validates :name, presence: true

  has_many :trains
  has_many :tickets
  has_many :ways
  has_many :stations, through: :ways

  before_validation :auto_naming

  protected

  def auto_naming
    if stations.present?
      self[:name] = "#{get_station_first.name} -> #{get_station_last.name}"
    else
      self[:name] = "Станции не выбраны"
    end
  end

  def get_station_first
    stations.ordered.first
  end

  def get_station_last
    stations.ordered.last
  end
end
