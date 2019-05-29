class Ticket < ApplicationRecord
  belongs_to :user, :optional => true
  belongs_to :train, :optional => true
  belongs_to :route, :optional => true
  has_many :orders
  has_many :stations, through: :orders

  validates :user, presence: true
  validates :user_name, presence: true
end
