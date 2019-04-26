class Train < ApplicationRecord
  belongs_to :route, optional: true
  has_many :tickets
  has_many :carriages

  def seats_count_by_type(carriages_type, seats_type)
    total_count = 0
    carriages = self.carriages.where(type: carriages_type)
    carriages.each { |c| total_count += c[seats_type] if c[seats_type].present? }
    total_count
  end
end
