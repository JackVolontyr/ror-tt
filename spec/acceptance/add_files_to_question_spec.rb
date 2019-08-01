require_relative 'acceptance_helper'

feature 'Add files to question', %q{
  In order to illustrate my question
  As an question's author
  I want to be able to attach files
} do

  given(:user) { create :user }

  before do
    @question_title_selector = '[data-spec="question__title"]'
    @question_body_selector = '[data-spec="question__body"]'
    @question_file_selector = '[data-spec="question__file"]'
    @question_submit_selector = '[data-spec="question__submit"]'

    @question_title = 'Title'
    @question_body = 'Body body.'

    @question_file_name = 'a.txt'
    @question_file = "#{Rails.root}/spec/files/#{@question_file_name}"
    @question_file_href = "/uploads/attachment/file/1/#{@question_file_name}"

    @question_image_name = 'a.jpg'
    @question_image = "#{Rails.root}/spec/files/#{@question_image_name}"
    @question_image_selector = "img[src*='#{@question_image_name}']"

    log_in user
    visit welcomes_path

    find(@question_title_selector).set @question_title
    find(@question_body_selector).set @question_body
  end

  scenario 'User adds file when asks question' do
    find(@question_file_selector).set @question_file
    find(@question_submit_selector).click
    expect(page).to have_link @question_file_name, href: @question_file_href
  end

  scenario 'User adds image file when asks question' do
    find(@question_file_selector).set @question_image
    find(@question_submit_selector).click
    expect(page).to have_css @question_image_selector
  end
end