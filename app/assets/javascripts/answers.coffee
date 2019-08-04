$(document).on 'turbolinks:load', () ->
  $ ->
    W = window
    
    # data-answer
    da = (selector) -> return "[data-answer='#{selector}']"

    # fullSelector
    fs = (selector, edit = false) ->
      if edit
        return "#{da 'edit-container'} #{da selector}"
      else
        return "#{da 'container'} #{da selector}"

    #
    grid_reset = () ->
      W.setRandomColor()
      W.resizeAllGridItems()
      $('img').on 'load', () -> W.resizeAllGridItems()

    # answer form reset with grid reset
    answer_form_reset = () ->
      W.ajaxOutputForError.html('')
      grid_reset()

    # CREATE hide show button and open form with focus
    $(document).on "click", fs('show'), (e) ->
      e.preventDefault()
      form = $(this).parents(da('container')).children(da('form'))
      $(this).hide()
      form.show()
      form.children(da('body')).focus()
      W.resizeAllGridItems()

    # CREATE when submit clicked
    $(document).on "click", fs('submit'), (e) ->
      parent = $(this).parents(da('container'))
      # need for delete action
      W.ajaxOutputForAnswer = parent.children(da('output'))
      W.ajaxOutputForError = parent.children(da('error-output'))
      # go to answers/create.js.erb

    # UPDATE toggle form with focus
    $(document).on "click", fs('edit', true), (e) ->
      e.preventDefault()
      editForm = $(this).parents(da('edit-container')).children(da('edit-form'))
      editForm.show()
      editForm.children(da('edit-body')).focus()
      W.resizeAllGridItems()

    # UPDATE when submit clicked
    $(document).on "click", fs('edit-submit', true), (e) ->
      parent = $(this).parents(da('edit-container'))
      W.ajaxEditOutputForAnswer = parent.children(da('edit-output'))
      W.ajaxEditOutputForError = parent.children(da('edit-error'))
      W.editFormForAnswer = parent.children(da('edit-form'));
      # go to answers/update.js.erb

    # DESTROY toggle form
    $(document).on "click", fs('delete', true), (e) ->
      e.preventDefault()
      deleteAlert = $(this).parents(da('edit-container')).children(da('delete-alert'))
      deleteAlert.show()
      W.resizeAllGridItems()

    # DESTROY when submit clicked
    $(fs('delete-submit', true)).on "click", (e) ->
      parent = $(this).parents(da('container'))
      W.ajaxOutputForAnswer = parent.children(da('output'))
      # go to answers/destroy.js.erb
