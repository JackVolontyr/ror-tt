require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  let(:question) { create :question }

  describe 'GET #index' do
    let(:questions) { create_list :question, 2 }

    before { get :index }

    it 'populates an array of all questions' do
      expect(assigns(:questions)).to match_array questions
    end
  end

  describe 'GET #show' do

    before { get :show, params: { id: question.id } }

    it 'assigns the requested question to @question' do
      expect(assigns(:question)).to eq question
    end

    it 'assigns new answer for question' do
      expect(assigns(:answer)).to be_a_new Answer
    end
  end

  describe 'GET #new' do
    sign_in_user
    before { get :new }

    it 'assigns a new Question to @question' do
      expect(assigns(:question)).to be_a_new Question
    end
  end

  describe 'GET #edit' do
    sign_in_user
    before { get :edit, params: { id: question.id } }

    it 'assigns the requested question to @question' do
      expect(assigns(:question)).to eq question
    end
  end

  describe 'POST #create' do
    sign_in_user

    context 'with valid attributes' do
      it 'save new question' do
        expect { post :create, params: { question: attributes_for(:question) } }
            .to change(Question, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      it 'does not save new question' do
        expect { post :create, params: { question: attributes_for(:invalid_question) } }
            .to_not change(Question, :count)
      end
    end
  end

  describe 'PATCH #update' do
    sign_in_user

    context 'valid attributes' do
      it 'assigns the requested question to @question' do
        patch :update, params: { id: question, question: attributes_for(:question), format: :js }
        expect(assigns(:question)).to eq question
      end

      it 'change question attributes' do
        patch :update, params: {
            id: question, question: { title: "newtitle", body: "newbody" }, format: :js }

        question.reload
        expect(question.title).to eq "newtitle"
        expect(question.body).to eq "newbody"
      end
    end

    context 'invalid attributes' do
      before { patch :update, params: {
          id: question, question: { title: "newtitle", body: nil }, format: :js } }

      it 'does not change question attributes' do
        question.reload
        expect(question.title).to eq "MyQTitle"
        expect(question.body).to eq "MyQBody"
      end
    end
  end

  describe 'DELETE #destroy' do
    sign_in_user
    before { question }

    it 'deletes question' do
      # TODO: js: true
      # format: :js
      expect { delete :destroy, params: { id: question } }.to change(Question, :count).by(-1)
    end
  end
end
