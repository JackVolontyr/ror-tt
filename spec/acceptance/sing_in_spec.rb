require_relative 'acceptance_helper'

feature 'User sign in', %q{
  In order to be able to ask Question
  As an user
  I want to be able to sign in
} do

  given(:user) { create :user }

  scenario 'Registered User try to sign in' do
    log_in user
    expect(page).to have_content t_from(:sessions, 'signed_in')
    expect(current_path).to eq welcomes_path
  end

  scenario 'Non-registered User try to sign in' do
    log_in user, false
    expect(page).to have_content t_from(:failure, 'invalid_email')
    expect(current_path).to eq new_user_session_path
  end
end