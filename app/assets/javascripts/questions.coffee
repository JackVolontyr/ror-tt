$(document).on 'turbolinks:load', () ->
  $ ->
    allRandomColor = document.querySelectorAll '[data-random="color"]'
    allRandomColor.forEach((item) ->
      color = "##{((1 << 24) * Math.random() | 0).toString 16}"
      item.style.color = color
    )