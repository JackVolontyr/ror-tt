$(document).on 'turbolinks:load', () ->
  $ ->
    W = window

    # data-question
    da = (selector) -> return "[data-question='#{selector}']"

    # fullSelector
    fs = (selector, edit = false) ->
      if edit
        return "#{da 'edit-container'} #{da selector}"
      else
        return "#{da 'container'} #{da selector}"

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
      W.editQuestionTitleOutput = parent.children(da('edit-title'))
      W.editQuestionBodyOutput = parent.children(da('edit-body'))
      W.editQuestionError = parent.children(da('edit-error'))
      W.editQuestionForm = parent.children(da('edit-form'));
      # go to answers/update.js.erb


    # DESTROY toggle form
    $(document).on "click", fs('delete', true), (e) ->
      e.preventDefault()
      deleteAlert = $(this).parents(da('edit-container')).children(da('delete-alert'))
      deleteAlert.show()
      W.resizeAllGridItems()

    # TODO: js: true
    # DESTROY when submit clicked
    # $(fs('delete-submit', true)).on "click", (e) ->
      # W.questionsOutput = $(this).parents(da('output'))
      # go to answers/destroy.js.erb
