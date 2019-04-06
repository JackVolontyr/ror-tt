class Ticket < ApplicationRecord
  belongs_to :user, :optional => true
  belongs_to :train, :optional => true
  has_and_belongs_to_many :stations
end
