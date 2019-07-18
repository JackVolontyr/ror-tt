$(document).on 'turbolinks:load', () ->
  $ ->
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
      window.resizeAllGridItems()

    # UPDATE when submit clicked
    $(document).on "click", fs('edit-submit', true), (e) ->
      parent = $(this).parents(da('edit-container'))
      console.log(parent.children(da('edit-title')))
      window.editQuestionTitleOutput = parent.children(da('edit-title'))
      window.editQuestionBodyOutput = parent.children(da('edit-body'))
      window.editQuestionError = parent.children(da('edit-error'))
      window.editQuestionForm = parent.children(da('edit-form'));
      # go to answers/update.js.erb


    # DESTROY toggle form
    $(document).on "click", fs('delete', true), (e) ->
      e.preventDefault()
      deleteAlert = $(this).parents(da('edit-container')).children(da('delete-alert'))
      deleteAlert.show()
      window.resizeAllGridItems()

    # TODO: js: true
    # DESTROY when submit clicked
    # $(fs('delete-submit', true)).on "click", (e) ->
      # window.questionsOutput = $(this).parents(da('output'))
      # go to answers/destroy.js.erb
