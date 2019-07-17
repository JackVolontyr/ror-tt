require_relative 'acceptance_helper'

feature 'User create Answer', %q{
  In order to exchange my knowledge
  As an User
  I want to be able to create an Answer
} do

  given(:user) { create :user }
  given!(:question) { create :question }

  before do
    @answer_show_selector ='[data-spec="answer__show-form"]'
    @answer_body_selector = '[data-spec="answer__body"]'
    @answer_submit_selector = '[data-spec="answer__submit"]'
    @answer_body = 'It is body answer.'
    @answer_container_selector = '[data-spec="answer__container"]'
    @invalid_answer_title = ''

    @question_submit_selector = '[data-spec="question__submit"]'
    @question_title = 'Title'
    @question_body = 'Body body.'

    @error_message = "#{t_from :answer, 'body'} #{ (t_from :errors, 'blank')}"

    log_in user

    find(@answer_show_selector).click
  end

  scenario 'User create answer for the question', js: true do
    find(@answer_body_selector).set @answer_body
    find(@answer_submit_selector).click

    expect(current_path).to eq welcomes_path
    within @answer_container_selector do
      expect(page).to have_content @answer_body
      expect(page).to_not have_content @error_message
    end
  end

  scenario 'User try create answer with invalid params', js: true do
    find(@answer_body_selector).set @invalid_answer_title
    find(@answer_submit_selector).click

    expect(page).to have_content @error_message
    expect(current_path).to eq welcomes_path
  end
end