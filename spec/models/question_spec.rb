require 'rails_helper'

RSpec.describe Question, type: :model do
  it { should validate_presence_of :title }
  # it 'validates presents of title' do
  #   expect(Question.new(body: 'Body.')).to_not be_valid
  # end

  it { should validate_presence_of :body }
  # it 'validates presents of body' do
  #   expect(Question.new(title: 'Title.')).to_not be_valid
  # end
end
