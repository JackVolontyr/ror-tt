require_relative 'acceptance_helper'

feature 'User delete Answer', %q{
  In order to remove not actual Answer
  As an User
  I want to be able to delete the Answer
} do

  given!(:user) { create :user }
  given!(:question) { create :question }

  before do
    @answer_delete_open_selector = '[data-spec="delete-answer__delete-open"]'
    @answer_alert_selector = '[data-spec="delete-answer__alert"]'
    @answer_alert_submit_selector = '[data-spec="delete-answer__alert-submit"]'
  end

  describe 'Unauthenticated User' do
    given!(:answer) { create :answer, question: question }

    before { visit welcomes_path }

    scenario 'does not see the delete button' do
      expect(page).to_not have_selector @answer_delete_open_selector
    end

    scenario 'does not see the delete alert' do
      expect(page).to_not have_selector @answer_alert_selector
    end
  end

  describe 'Authenticated User' do
    given!(:answer) { create :answer, question: question }

    before { log_in user }

    scenario 'does not see the delete button' do
      expect(page).to_not have_selector @answer_delete_open_selector
    end

    scenario 'does not see the delete alert' do
      expect(page).to_not have_selector @answer_alert_selector
    end
  end

  describe 'User is author' do
    given!(:answer) { create :answer, question: question, user: user }

    before { log_in user }

    scenario 'see the delete button' do
      expect(page).to have_selector @answer_delete_open_selector
    end

    scenario 'User tries delete the answer', js: true do
      find(@answer_delete_open_selector).click
      expect(page).to have_selector @answer_alert_selector
      find(@answer_alert_submit_selector).click
      expect(page).to_not have_content answer.body
    end
  end
end