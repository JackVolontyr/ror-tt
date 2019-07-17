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
    end

    context 'with invalid attributes' do
      it 'does not save new answer' do
        expect { post :create, params: {
            answer: attributes_for(:invalid_answer), question_id: question, format: :js }
        }.to_not change(Answer, :count)
      end
    end
  end

  describe 'PATCH #update' do
    sign_in_user

    let(:answer) { create :answer, question: question }

    it 'assigns the requested answer to @answer' do
      patch :update, params: {
          id: answer, answer: attributes_for(:answer), question_id: question, format: :js }
      expect(assigns(:answer)).to eq answer
    end

    it 'change answer attributes' do
      patch :update, params: {
          id: answer, answer: { body: "newbody" }, question_id: question, format: :js }
      answer.reload
      expect(answer.body).to eq "newbody"
    end
  end

  describe 'DELETE #destroy' do
    sign_in_user

    let!(:answer) { create :answer, question: question }

    it 'delete answer' do
      expect { delete :destroy, params: {id: answer, question_id: question, format: :js } }
          .to change(Answer, :count).by(-1)
    end
  end
end
