class CarriageLuxury < Carriage
  validates :top_seats, :side_bottom_seats, :side_top_seats, absence: true

  def self.model_name
    Carriage.model_name
  end
end
