require_relative 'acceptance_helper'

feature 'Add files to answer', %q{
  In order to illustrate my answer
  As an answer's author
  I want to be able to attach files
} do

  given(:user) { create :user }
  given!(:question) { create :question }

  before do
    @answer_body_selector = '[data-spec="answer__body"]'
    @answer_file_selector = '[data-spec="answer__file"]'
    @answer_submit_selector = '[data-spec="answer__submit"]'

    @answer_body = 'Body body.'

    @answer_file_name = 'a.txt'
    @answer_file = "#{Rails.root}/spec/files/#{@answer_file_name}"
    @answer_file_href = "/uploads/attachment/file/1/#{@answer_file_name}"

    @answer_image_name = 'a.jpg'
    @answer_image = "#{Rails.root}/spec/files/#{@answer_image_name}"

    log_in user
    visit welcomes_path

    find(@answer_body_selector).set @answer_body
  end

  scenario 'User adds file to answer' do
    find(@answer_file_selector).set @answer_file
    find(@answer_submit_selector).click
    expect(page).to have_link @answer_file_name, href: @answer_file_href
  end

  scenario 'User adds image file to answer' do
    find(@answer_file_selector).set @answer_image
    find(@answer_submit_selector).click
    expect(page).to have_css("img[src*='#{@answer_image_name}']")
  end
end