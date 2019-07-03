class Ticket < ApplicationRecord
  include ApplicationHelper

  belongs_to :user, :optional => true
  belongs_to :train, :optional => true
  belongs_to :route, :optional => true
  has_many :orders
  has_many :stations, through: :orders

  validates_presence_of :name, :user, :user_name, :date

  before_validation :auto_naming
  before_create :add_id_to_name

  after_create :send_buy_notification
  after_destroy :send_delete_notification

  def auto_naming
    self[:name] = "#{get_train_number} #{get_station_first_name} -> #{get_station_last_name} (##{self[:id]})"
  end

  def add_id_to_name
    self[:name] = "#{get_train_number} #{get_station_first_name} -> #{get_station_last_name} (##{Ticket.maximum("id") + 1})"
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

  def send_buy_notification
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end

  def send_delete_notification
    TicketsMailer.delete_ticket(self.user, self).deliver_now
  end
end
