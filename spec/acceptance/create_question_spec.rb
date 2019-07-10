require 'rails_helper'

feature 'User create Question', %q{
  In order to get answer from community
  As an (authenticated) user
  I want to be able to ask question
} do

  given(:user) { create :user }

  before {
    @submit_button_selector =
        "input[type='submit'][value='#{t_from :new_question, 'submit'}']"
  }

  scenario 'Registered user try to create question' do
    sign_in user

    fill_in t_from(:new_question, 'title'), with: 'Title'
    fill_in t_from(:new_question, 'body'), with: 'Body body.'
    find(@submit_button_selector).click

    expect(page).to have_content t_from(:new_question, 'success')
    expect(current_path).to eq welcomes_path
  end

  scenario 'Registered user try to create question with invalid params' do
    sign_in user

    fill_in t_from(:new_question, 'title'), with: ''
    fill_in t_from(:new_question, 'body'), with: 'Body body.'
    find(@submit_button_selector).click

    expect(page).to have_content t_from(:errors, 'blank')
    expect(current_path).to eq welcomes_path
  end

  scenario 'Non-registered user try to sign in' do
    visit welcomes_path

    fill_in t_from(:new_question, 'title'), with: 'Title'
    fill_in t_from(:new_question, 'body'), with: 'Body body.'
    find(@submit_button_selector).click

    expect(page).to have_content t_from(:failure, 'unauthenticated')
    expect(current_path).to eq new_user_session_path
  end
end
