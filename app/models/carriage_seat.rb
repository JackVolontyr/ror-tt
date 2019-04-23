class CarriageSeat < Carriage
  validates :seats, presence: true

  def self.model_name
    Carriage.model_name
  end
end
