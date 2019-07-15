$(document).on 'turbolinks:load', () ->
  $ ->
    $('[data-answer="container"] [data-answer="show"]').on "click", (e) ->
      e.preventDefault()

      show = $ this
      parent = show.parents('[data-answer="container"]')
      form = parent.children('[data-answer="form"]')
      body = form.children('[data-answer="body"]')
      ajaxOutputForAnswer = parent.children('[data-answer="ajax-output"]')
      ajaxOutputForError = parent.children('[data-answer="ajax-error-output"]')

      show.hide()
      form.show()

      window.resizeAllGridItems()

      window.ajaxOutputForAnswer = ajaxOutputForAnswer
      window.ajaxOutputForError = ajaxOutputForError
      window.bodyForAnswer = body