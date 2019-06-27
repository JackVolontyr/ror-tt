$(document).on 'turbolinks:load', () ->
  $ ->
    $("[data-row] [data-edit]").on "click", (e) ->
      e.preventDefault()

      edit = $ this
      row = edit.parents "[data-row]"
      indexRow = row.attr "data-index"
      form = $ "[data-form][data-index=#{indexRow}]"

      row.attr "data-vissible", false
      form.attr "data-vissible", true

    $("[data-cancel]").on "click", (e) ->
      e.preventDefault()

      cancel = $ this
      form = cancel.parents "[data-form]"
      indexForm = form.attr "data-index"
      row = $ "[data-row][data-index=#{indexForm}]"

      row.attr "data-vissible", true
      form.attr "data-vissible", false