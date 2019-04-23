module StationsHelper
  def get_caption(type)
    base = ["Имя", "Пути", "Билеты"]

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
