class Carriage < ApplicationRecord
  serialize :seats, JSON
  belongs_to :train, optional: true
end
