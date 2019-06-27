$ ->
  $("[data-edit]").on "click", (e) ->
    e.preventDefault()

    edit = $ this
    row = edit.parents "[data-row-index]"
    indexRow = row.attr "data-row-index"
    form = $ "[data-form-index=#{indexRow}]"

    row.attr "data-vissible", false
    form.attr "data-vissible", true

  $("[data-cancel]").on "click", (e) ->
    e.preventDefault()

    cancel = $ this
    form = cancel.parents "[data-form-index]"
    indexForm = form.attr "data-form-index"
    row = $ "[data-row-index=#{indexForm}]"

    row.attr "data-vissible", true
    form.attr "data-vissible", false
