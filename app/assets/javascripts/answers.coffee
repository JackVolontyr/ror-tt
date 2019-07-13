$(document).on 'turbolinks:load', () ->
  $ ->
    $('[data-answer="container"] [data-answer="show"]').on "click", (e) ->
      e.preventDefault()

      show = $ this
      parent = show.parents('[data-answer="container"]')
      form = parent.children('[data-answer="form"]')

      show.hide()
      form.show()

      window.resizeAllGridItems()