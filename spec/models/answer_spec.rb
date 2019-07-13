require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe 'association' do
    it { should belong_to(:user).class_name('User')}
    it { should belong_to(:question).class_name('Question')}
  end

  it { should validate_presence_of :body }
  it { should validate_presence_of :question }
  it { should validate_presence_of :user }
end
