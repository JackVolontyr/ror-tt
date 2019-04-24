module ApplicationHelper
  def table_cell(content)
    content_tag :div, content, class: "tutu-table__cell"
  end

  def table_cell_with
    content_tag :div, yield, class: "tutu-table__cell"
  end

  def get_caption(for_item, type)
    case for_item
    when "carriages"
      for_item = ["Номер", "Тип Вагона", "Н Места", "В Места", "НБ Места", "ВБ Места", "Места", "Поезда"]
    when "routes"
      for_item = ["Имя", "Поезд", "Станции"]
    when "stations"
      for_item = ["Имя", "Пути", "Билеты"]
    else
      for_item = []
    end

    case type
    when "index"
      ["№"] + for_item + ["", "", ""]
    when "show"
      for_item + ["", "", ""]
    when "form"
      for_item
    else
      []
    end
  end
end
