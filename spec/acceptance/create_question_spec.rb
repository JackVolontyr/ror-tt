require_relative 'acceptance_helper'

feature 'User create Question', %q{
  In order to get answer from community
  As an (authenticated) user
  I want to be able to ask the question
} do

  given(:user) { create :user }

  before {
    @question_submit_selector = '[data-spec="question_submit"]'
    @question_title = 'Title'
    @question_body = 'Body body.'
    @invalid_question_title = ''
  }

  scenario 'Registered user try to create question' do
    log_in user

    fill_in t_from(:new_question, 'title'), with: @question_title
    fill_in t_from(:new_question, 'body'), with: @question_body

    find(@question_submit_selector).click

    expect(page).to have_content t_from(:new_question, 'success')
    expect(current_path).to eq welcomes_path
  end

  scenario 'Registered user try to create question with invalid params' do
    log_in user

    fill_in t_from(:new_question, 'title'), with: @invalid_question_title
    fill_in t_from(:new_question, 'body'), with: @question_body
    find(@question_submit_selector).click

    expect(page).to have_content t_from(:errors, 'blank')
    expect(current_path).to eq welcomes_path
  end

  scenario 'Non-registered user try to create question' do
    visit welcomes_path

    fill_in t_from(:new_question, 'title'), with: @question_title
    fill_in t_from(:new_question, 'body'), with: @question_body
    find(@question_submit_selector).click

    expect(page).to have_content t_from(:failure, 'unauthenticated')
    expect(current_path).to eq new_user_session_path
  end
end
