require 'rails_helper'

RSpec.describe Question, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :body }
  it { should validate_presence_of :user }

  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
  end
end
