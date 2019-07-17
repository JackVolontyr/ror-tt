require_relative 'acceptance_helper'

feature 'User edit Question', %q{
  In order to fix mistake
  As an (User) author of Question
  I want to be able to edit an Question
} do

  given!(:user) { create :user }

  before do
    @question_edit_selector = '[data-spec="edit-question__edit"]'
    @question_body_selector = '[data-spec="edit-question__body"]'
    @question_form_selector = '[data-spec="edit-question__form"]'
    @question_submit_selector = '[data-spec="edit-question__submit"]'
    @question_fixed = 'Fixed question'
  end

  describe 'Unauthenticated User' do
    given!(:question) { create :question }

    before { visit welcomes_path }

    scenario 'does not see the edit button' do
      expect(page).to_not have_selector @question_edit_selector
    end

    scenario 'does not see the edit form' do
      expect(page).to_not have_selector @question_form_selector
    end
  end

  describe 'Authenticated User' do
    given!(:question) { create :question }

    before { log_in user }

    scenario 'does not see the edit button' do
      expect(page).to_not have_selector @question_edit_selector
    end

    scenario 'does not see the edit form' do
      expect(page).to_not have_selector @question_form_selector
    end
  end

  describe 'User is author' do
    given!(:question) { create :question, user: user }

    before { log_in user }

    scenario 'see the edit button' do
      expect(page).to have_selector @question_edit_selector
    end

    scenario 'User tries edit the question', js: true do
      find(@question_edit_selector).click
      expect(page).to have_selector @question_form_selector

      find(@question_body_selector).set @question_fixed
      find(@question_submit_selector).click
      expect(page).to have_content @question_fixed
      expect(page).to_not have_content question.body
      expect(page).to_not have_selector @question_form_selector
    end
  end
end