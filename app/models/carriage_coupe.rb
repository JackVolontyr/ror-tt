class CarriageCoupe < Carriage
  validates :side_bottom_seats, :side_top_seats, absence: true

  def self.model_name
    Carriage.model_name
  end
end
