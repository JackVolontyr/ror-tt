class User < ApplicationRecord
  has_many :tickets, dependent: :destroy
end
