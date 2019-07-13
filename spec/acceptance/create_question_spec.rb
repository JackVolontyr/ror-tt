require 'rails_helper'

feature 'User create Question', %q{
  In order to get answer from community
  As an (authenticated) user
  I want to be able to ask the question
} do

  given(:user) { create :user }

  before {
    @submit_button_selector = '[data-spec="question_submit"]'
    @new_question_title = 'Title'
    @new_question_body = 'Body body.'
    @invalid_question_title = ''
  }

  scenario 'Registered user try to create question' do
    sign_in user

    fill_in t_from(:new_question, 'title'), with: @new_question_title
    fill_in t_from(:new_question, 'body'), with: @new_question_body
    find(@submit_button_selector).click

    expect(page).to have_content t_from(:new_question, 'success')
    expect(current_path).to eq welcomes_path
  end

  scenario 'Registered user try to create question with invalid params' do
    sign_in user

    fill_in t_from(:new_question, 'title'), with: @invalid_question_title
    fill_in t_from(:new_question, 'body'), with: @new_question_body
    find(@submit_button_selector).click

    expect(page).to have_content t_from(:errors, 'blank')
    expect(current_path).to eq welcomes_path
  end

  scenario 'Non-registered user try to sign in' do
    visit welcomes_path

    fill_in t_from(:new_question, 'title'), with: @new_question_title
    fill_in t_from(:new_question, 'body'), with: @new_question_body
    find(@submit_button_selector).click

    expect(page).to have_content t_from(:failure, 'unauthenticated')
    expect(current_path).to eq new_user_session_path
  end
end
