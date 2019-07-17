$(document).on 'turbolinks:load', () ->
  $ ->
    # data-answer
    da = (selector) -> return "[data-answer='#{selector}']"

    # fullSelector
    fs = (selector, edit = false) ->
      if edit
        return "#{da 'edit-container'} #{da selector}"
      else
        return "#{da 'container'} #{da selector}"

    $(document).on "click", fs('show'), (e) ->
      e.preventDefault()
      form = $(this).parents(da('container')).children(da('form'))
      $(this).hide()
      form.show()
      form.children(da('body')).focus()
      window.resizeAllGridItems()

    $(document).on "click", fs('submit'), (e) ->
      parent = $(this).parents(da('container'))
      window.ajaxOutputForAnswer = parent.children(da('ajax-output'))
      window.ajaxOutputForError = parent.children(da('ajax-error-output'))
      window.bodyForAnswer = parent.children(da('form')).children(da('body'))
      # go to answers/create.js.erb

    $(document).on "click", fs('edit', true), (e) ->
      e.preventDefault()
      editForm = $(this).parents(da('edit-container')).children(da('edit-form'))
      editForm.toggle()
      editForm.children(da('edit-body')).focus()
      window.resizeAllGridItems()

    $(document).on "click", fs('edit-submit', true), (e) ->
      parent = $(this).parents(da('edit-container'))
      window.ajaxEditOutputForAnswer = parent.children(da('ajax-edit-output'))
      window.ajaxEditOutputForError = parent.children(da('ajax-edit-error-output'))
      window.editBodyForAnswer = parent.children(da('edit-body'));
      window.editFormForAnswer = parent.children(da('edit-form'));
      # go to answers/update.js.erb
