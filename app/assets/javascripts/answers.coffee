$(document).on 'turbolinks:load', () ->
  $ ->
    W = window

    # get element
    W.gEQ = (element, questionId) -> return $("[data-question-id='#{questionId}']").find("[data-answer='#{element}']")
    W.gEA = (element, questionId, answerId) -> return $("[data-question-id='#{questionId}']").find("[data-answer-id='#{answerId}']").find("[data-answer='#{element}']")

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
      form = $(this).parents(da('container')).find(da('form'))
      $(this).hide()
      form.show()
      form.find(da('body')).focus()
      W.resizeAllGridItems()

    # CREATE when submit clicked
    $(document).on "click", fs('submit'), (e) ->
      parent = $(this).parents(da('container'))
      # need for delete action
      W.ajaxOutputForAnswer = parent.find(da('output'))
      W.ajaxOutputForError = parent.find(da('error-output'))
      # go to answers/create.js.erb

    # UPDATE toggle form with focus
    $(document).on "click", fs('edit', true), (e) ->
      e.preventDefault()
      editForm = $(this).parents(da('edit-container')).find(da('edit-form'))
      editForm.show()
      editForm.find(da('edit-body')).focus()
      W.resizeAllGridItems()

    # UPDATE when submit clicked
    $(document).on "click", fs('edit-submit', true), (e) ->
      parent = $(this).parents(da('edit-container'))
      W.ajaxEditOutputForAnswer = parent.find(da('edit-output'))
      W.ajaxEditOutputForError = parent.find(da('edit-error'))
      # go to answers/update.js.erb

    # DESTROY toggle form
    $(document).on "click", fs('delete', true), (e) ->
      e.preventDefault()
      deleteAlert = $(this).parents(da('edit-container')).find(da('delete-alert'))
      deleteAlert.show()
      W.resizeAllGridItems()

    # DESTROY when submit clicked
    $(fs('delete-submit', true)).on "click", (e) ->
      parent = $(this).parents(da('container'))
      W.ajaxOutputForAnswer = parent.find(da('output'))
      # go to answers/destroy.js.erb
