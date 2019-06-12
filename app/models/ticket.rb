class Ticket < ApplicationRecord
  include ApplicationHelper

  belongs_to :user, :optional => true
  belongs_to :train, :optional => true
  belongs_to :route, :optional => true
  has_many :orders
  has_many :stations, through: :orders

  validates_presence_of :name, :user, :user_name

  before_validation :auto_naming

  def auto_naming
    self[:name] = "#{get_train_number} #{get_station_first_name} -> #{get_station_last_name}"
  end

  def get_station_first_name
    station_name_by_id(self[:station_first_id])
  end

  def get_station_last_name
    station_name_by_id(self[:station_last_id])
  end

  def get_train_number
    train_number_by_id(self[:train_id])
  end
end
