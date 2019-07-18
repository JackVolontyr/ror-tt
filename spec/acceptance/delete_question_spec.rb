require_relative 'acceptance_helper'

feature 'User delete Question', %q{
  In order to remove not actual Question
  As an User
  I want to be able to delete the Question
} do

  given!(:user) { create :user }

  before do
    @question_delete_open_selector = '[data-spec="delete-question__delete-open"]'
    @question_alert_selector = '[data-spec="delete-question__alert"]'
    @question_alert_submit_selector = '[data-spec="delete-question__alert-submit"]'
  end

  describe 'Unauthenticated User' do
    given!(:question) { create :question }

    before { visit welcomes_path }

    scenario 'does not see the delete button' do
      expect(page).to_not have_selector @question_delete_open_selector
    end

    scenario 'does not see the delete alert' do
      expect(page).to_not have_selector @question_alert_selector
    end
  end

  describe 'Authenticated User' do
    given!(:question) { create :question }

    before { log_in user }

    scenario 'does not see the delete button' do
      expect(page).to_not have_selector @question_delete_open_selector
    end

    scenario 'does not see the delete alert' do
      expect(page).to_not have_selector @question_alert_selector
    end
  end

  describe 'User is author' do
    given!(:question) { create :question, user: user }

    before { log_in user }

    scenario 'see the delete button' do
      expect(page).to have_selector @question_delete_open_selector
    end

    # TODO: js: true
    scenario 'User tries delete the Question' do
      find(@question_delete_open_selector).click
      expect(page).to have_selector @question_alert_selector
      find(@question_alert_submit_selector).click
      expect(page).to_not have_content question.body
      expect(page).to_not have_selector @question_alert_selector
    end
  end
end