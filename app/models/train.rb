class Train < ApplicationRecord
  belongs_to :route, :optional => true
  has_many :tickets
  has_many :carriages
end
