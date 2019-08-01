require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
    it { should have_many(:answers).class_name('Answer') }
    it { should have_many(:attachments).class_name('Attachment') }
  end

  it { should validate_presence_of :title }
  it { should validate_presence_of :body }
  it { should validate_presence_of :user }

  it { should accept_nested_attributes_for :attachments }
end
