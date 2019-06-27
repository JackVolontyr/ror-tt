class CarriageEconom < Carriage
  validates :side_bottom_seats, :side_top_seats, presence: true

  def self.model_name
    Carriage.model_name
  end
end
