require_relative 'acceptance_helper'

feature 'User edit Answer', %q{
  In order to fix mistake
  As an (User) author of Answer
  I want to be able to edit an Answer
} do

  given!(:user) { create :user }
  given!(:question) { create :question }

  before do
    @answer_edit_selector = '[data-spec="edit-answer__edit"]'
    @answer_body_selector = '[data-spec="edit-answer__body"]'
    @answer_form_selector = '[data-spec="edit-answer__form"]'
    @answer_submit_selector = '[data-spec="edit-answer__submit"]'
    @answer_fixed = 'Fixed answer'
  end

  describe 'Unauthenticated User' do
    scenario 'does not see the edit button' do
      expect(page).to_not have_selector @answer_edit_selector
    end

    scenario 'does not see the edit form' do
      expect(page).to_not have_selector @answer_form_selector
    end
  end

  describe 'Authenticated User' do
    before { log_in user }

    scenario 'does not see the edit button' do
      expect(page).to_not have_selector @answer_edit_selector
    end

    scenario 'does not see the edit form' do
      expect(page).to_not have_selector @answer_form_selector
    end
  end

  describe 'User is author' do
    given!(:answer) { create :answer, question: question, user: user }

    before do
      log_in user
    end

    scenario 'see the edit button' do
      expect(page).to have_selector @answer_edit_selector
    end

    scenario 'User tries edit the answer', js: true do
      find(@answer_edit_selector).click
      expect(page).to have_selector @answer_form_selector

      find(@answer_body_selector).set @answer_fixed
      find(@answer_submit_selector).click
      expect(page).to have_content @answer_fixed
      expect(page).to_not have_content answer.body
      expect(page).to_not have_selector @answer_form_selector
    end
  end
end