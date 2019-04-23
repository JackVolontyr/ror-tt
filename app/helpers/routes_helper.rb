module RoutesHelper
  def get_caption(type)
    base = ["Имя", "Поезд", "Станции"]

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
end
