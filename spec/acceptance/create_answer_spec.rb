require 'rails_helper'

feature 'User create answer', %q{
  In order to exchange my knowledge
  As an (authenticated) user
  I want to be able to create an answer
} do

  given(:user) { create :user }
  given(:question) { create :question }

  before {
    @answer_show_button_selector ='[data-spec="answer_show_form"]'
    @answer_submit_button_selector = '[data-spec="answer_submit"]'
    @new_answer = 'It is body answer.'
    @answer_container_selector = '[data-spec="answer_container"]'
    @invalid_answer_title = ''

    @question_submit_button_selector = '[data-spec="question_submit"]'
    @new_question_title = 'Title'
    @new_question_body = 'Body body.'

    sign_in user

    fill_in t_from(:new_question, 'title'), with: @new_question_title
    fill_in t_from(:new_question, 'body'), with: @new_question_body
    find(@question_submit_button_selector).click

    find(@answer_show_button_selector).click
  }

  scenario 'User create answer for the question' do
    fill_in t_from(:new_answer, 'body'), with: @new_answer
    find(@answer_submit_button_selector).click

    expect(current_path).to eq welcomes_path
    expect(page).to have_content t_from(:new_answer, 'success')
    within @answer_container_selector do
      expect(page).to have_content @new_answer
    end
  end

  scenario 'User try create answer with invalid params' do
    fill_in t_from(:new_answer, 'body'), with: @invalid_answer_title
    find(@answer_submit_button_selector).click

    expect(page).to have_content t_from(:errors, 'blank')
    expect(current_path).to eq welcomes_path
  end
end