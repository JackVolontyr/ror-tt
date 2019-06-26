module ApplicationHelper

  def form_naming(text, item)
    I18n.t(text, action: item.new_record? ? t("common.create") : t("common.edit"))
  end

  def nothing
    "----"
  end

  def station_name_by_id(id_from)
    @station = Station.find_by(id: id_from)
    @station ? @station.name : nothing
  end

  def station_id_by_name(name_from)
    @station = Station.find_by(name: name_from)
    @station ? @station.name : nothing
  end

  def train_number_by_id(id_from)
    @train = Train.find_by(id: id_from)
    @train ? @train.number : nothing
  end

  def present_or_string(item, item_output = nil, info)
    if item.present? && item_output.nil?
      item
    elsif item.present?
      item[item_output]
    else
      info
    end
  end

  def table_cell(content)
    content_tag :div, content, class: "tutu-table__cell"
  end

  def inline_info(text)
    content_tag :span, text, class: "tutu-text--info"
  end

  def get_caption(for_item, type)
    case for_item
    when "carriages"
      for_item = [I18n.t("h.number"),
                  I18n.t("h.m.carriage.type"),
                  I18n.t("h.m.carriage.bottom_seats"),
                  I18n.t("h.m.carriage.top_seats"),
                  I18n.t("h.m.carriage.side_bottom_seats"),
                  I18n.t("h.m.carriage.side_top_seats"),
                  I18n.t("h.m.carriage.seats"),
                  I18n.t("h.trains")]
    when "routes"
      for_item = [I18n.t("h.route"),
                  I18n.t("h.trains"),
                  I18n.t("h.stations")]
    when "search_routes"
      for_item = [I18n.t("h.route"),
                  I18n.t("h.stations")]
    when "stations"
      for_item = [I18n.t("h.name"),
                  I18n.t("h.routes"),
                  I18n.t("h.tickets")]
    when "trains"
      for_item = [I18n.t("h.number"),
                  I18n.t("h.route"),
                  I18n.t("h.carriages")]
    when "tickets"
      for_item = [I18n.t("h.ticket"),
                  I18n.t("h.m.ticket.user_name"),
                  I18n.t("h.train"),
                  I18n.t("h.user"),
                  I18n.t("h.route"),
                  I18n.t("h.m.ticket.comments"),
                  I18n.t("h.m.ticket.station_first"),
                  I18n.t("h.m.ticket.station_last")]
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
    when "user"
      ["№"] + for_item
    else
      []
    end
  end

  def get_carriage_types
    {I18n.t("h.s.carriage.coupe") => "CarriageCoupe",
     I18n.t("h.s.carriage.econom") => "CarriageEconom",
     I18n.t("h.s.carriage.seat") => "CarriageSeat",
     I18n.t("h.s.carriage.luxury") => "CarriageLuxury"}
  end

  def get_seat_types
    {I18n.t("h.s.carriage.bottom_seats") => "bottom_seats",
     I18n.t("h.s.carriage.top_seats") => "top_seats",
     I18n.t("h.s.carriage.side_bottom_seats") => "side_bottom_seats",
     I18n.t("h.s.carriage.side_top_seats") => "side_top_seats"}
  end
end
