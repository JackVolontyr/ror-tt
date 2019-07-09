$(document).on 'turbolinks:load', () ->
  $ ->
    hashCode = (str) ->
      for x in [0..(str.length - 1)]
        hash = str.charCodeAt(x) + ((hash << 5) - hash)
      return hash

    intToRGB = (hash) ->
      c = (hash & 0x00FFFFFF).toString(16).toUpperCase()
      return "00000".substring(0, 6 - c.length) + c

    allRandomColor = document.querySelectorAll '[data-random="color"]'
    allRandomColor.forEach((item) ->
      color = '#' + intToRGB(hashCode(item.innerHTML))
      item.style.color = color
    )