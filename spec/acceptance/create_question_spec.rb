require_relative 'acceptance_helper'

feature 'User create Question', %q{
  In order to get answer from community
  As an User
  I want to be able to ask the Question
} do

  given(:user) { create :user }

  before do
    @question_title_selector = '[data-spec="question__title"]'
    @question_body_selector = '[data-spec="question__body"]'
    @question_submit_selector = '[data-spec="question__submit"]'
    @question_title = 'Title'
    @question_body = 'Body body.'
    @invalid_question_title = ''
  end

  scenario 'Registered user try to create Question' do
    log_in user

    find(@question_title_selector).set @question_title
    find(@question_body_selector).set @question_body

    find(@question_submit_selector).click

    expect(page).to have_content t_from(:new_question, 'success')
    expect(current_path).to eq welcomes_path
  end

  scenario 'Registered user try to create Question with invalid params' do
    log_in user

    find(@question_title_selector).set @invalid_question_title
    find(@question_body_selector).set @question_body
    find(@question_submit_selector).click

    expect(page).to have_content t_from(:errors, 'blank')
    expect(current_path).to eq welcomes_path
  end

  scenario 'Non-registered user try to create Question' do
    visit welcomes_path

    find(@question_title_selector).set @question_title
    find(@question_body_selector).set @question_body
    find(@question_submit_selector).click

    expect(page).to have_content t_from(:failure, 'unauthenticated')
    expect(current_path).to eq new_user_session_path
  end
end
