module AcceptanceHelper
  def sign_in(user, correct = true)
    correct ? (wrong_email = nil) : (wrong_email = 'wrong@test.com')
    @sign_in_button_selector =
        "input[type='submit'][value='#{t_from :new_user, 'login'}']"

    visit new_user_session_path
    fill_in t_from(:new_user, 'email'), with: wrong_email || user.email
    fill_in t_from(:new_user, 'password'), with: user.password
    find(@sign_in_button_selector).click
  end

  def t_from(from, string)
    case from
    when :new_user
      path = 'devise.registrations.new.'
    when :sessions
      path = 'devise.sessions.'
    when :failure
      path = 'devise.failure.'
    when :new_question
      path = 'questions.new.'
    when :errors
      path = 'activerecord.errors.messages.'
    else
      path = ''
    end
    I18n.t "#{path}#{string}"
  end
end