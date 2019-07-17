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

    # CREATE hide show button and open form with focus
    $(document).on "click", fs('show'), (e) ->
      e.preventDefault()
      form = $(this).parents(da('container')).children(da('form'))
      $(this).hide()
      form.show()
      form.children(da('body')).focus()
      window.resizeAllGridItems()

    # CREATE when submit clicked
    $(document).on "click", fs('submit'), (e) ->
      parent = $(this).parents(da('container'))
      form = parent.children(da('form'))
      window.ajaxOutputForAnswer = parent.children(da('ajax-output'))
      window.ajaxOutputForError = parent.children(da('ajax-error-output'))
      window.showForAnswer = parent.children(fs('show'))
      window.formForAnswer = form
      window.bodyForAnswer = form.children(da('body'))
      # go to answers/create.js.erb

    # UPDATE toggle form with focus
    $(document).on "click", fs('edit', true), (e) ->
      e.preventDefault()
      editForm = $(this).parents(da('edit-container')).children(da('edit-form'))
      editForm.toggle()
      editForm.children(da('edit-body')).focus()
      window.resizeAllGridItems()

    # UPDATE when submit clicked
    $(document).on "click", fs('edit-submit', true), (e) ->
      parent = $(this).parents(da('edit-container'))
      window.ajaxEditOutputForAnswer = parent.children(da('ajax-edit-output'))
      window.ajaxEditOutputForError = parent.children(da('ajax-edit-error-output'))
      window.editFormForAnswer = parent.children(da('edit-form'));
      # go to answers/update.js.erb

    # DESTROY toggle form
    $(document).on "click", fs('delete', true), (e) ->
      e.preventDefault()
      deleteAlert = $(this).parents(da('edit-container')).children(da('delete-alert'))
      deleteAlert.toggle()
      window.resizeAllGridItems()

    # DESTROY when submit clicked
    $(fs('delete-submit', true)).on "click", (e) ->
      parent = $(this).parents(da('container'))
      window.ajaxOutputForAnswer = parent.children(da('ajax-output'))
      # go to answers/destroy.js.erb
