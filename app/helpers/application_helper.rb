module ApplicationHelper
  def table_cell(content)
    content_tag :div, content, class: "tutu-table__cell"
  end

  def table_cell_with
    content_tag :div, yield, class: "tutu-table__cell"
  end
end
