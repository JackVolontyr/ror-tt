class CarriageEconom < Carriage
  validates :side_top_seats, :side_bottom_seats, presence: true

  def self.model_name
    Carriage.model_name
  end
end
