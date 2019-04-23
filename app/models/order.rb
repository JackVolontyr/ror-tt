class Order < ApplicationRecord
  belongs_to :station
  belongs_to :ticket
end
