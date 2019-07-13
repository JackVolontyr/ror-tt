require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let(:question) { create :question }

  describe 'GET #create' do
    sign_in_user

    context 'with valid attributes' do
      it 'save new answer' do
        expect { post :create, params: {
            answer: attributes_for(:answer), question_id: question, format: :js }
        }.to change(question.answers, :count).by(1)
      end

      it 'redirect to welcomes path' do
        post :create, params: {
            answer: attributes_for(:answer), question_id: question, format: :js }
      end
    end

    context 'with invalid attributes' do
      it 'does not save new answer' do
        expect { post :create, params: {
            answer: attributes_for(:invalid_answer), question_id: question, format: :js }
        }.to_not change(Answer, :count)
      end

      it 'redirect to welcomes path' do
        post :create, params: {
            answer: attributes_for(:invalid_answer), question_id: question, format: :js }
      end
    end
  end
end
