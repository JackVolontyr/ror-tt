module AcceptanceMacros
  def log_in(user, correct = true)
    correct ? (wrong_email = nil) : (wrong_email = 'wrong@test.com')
    @sign_in_selector = '[data-spec="login"]'
    @email_selector = '[data-spec="email"]'
    @password_selector = '[data-spec="password"]'

    visit new_user_session_path

    find(@email_selector).set wrong_email || user.email
    find(@password_selector).set wrong_email || user.password
    find(@sign_in_selector).click
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
    when :new_answer
      path = 'answers.new.'
    when :errors
      path = 'activerecord.errors.messages.'
    else
      path = ''
    end
    I18n.t "#{path}#{string}"
  end

  def saop
    save_and_open_page
  end

  def bb
    byebug
  end
end