class Station < ApplicationRecord
  has_and_belongs_to_many :routes
  has_and_belongs_to_many :tickets
end
