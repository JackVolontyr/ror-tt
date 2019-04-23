module CarriagesHelper
  def get_caption(type)
    base = ["Номер", "Тип Вагона", "Н Места", "В Места", "НБ Места", "ВБ Места", "Места", "Поезда"]

    case type
    when "index"
      ["№"] + base + ["", "", ""]
    when "show"
      base + ["", "", ""]
    when "form"
      base
    else
      []
    end
  end

  def get_carriage_types
    {
      "купе": "CarriageCoupe",
      "плацкарт": "CarriageEconom",
      "сидячие": "CarriageSeat",
      "св": "CarriageLuxury"
    }
  end
end