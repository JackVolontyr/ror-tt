class AnswersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_answer, except: [:create]
  before_action :set_question, only: [:create, :destroy]

  def create
    @answer = @question.answers.build answer_params
    @answer.user = current_user
    @answer.save
  end

  def update
    @answer.update(answer_params)
  end

  def destroy
    @answer.destroy
  end

  private
  def answer_params
    params.require(:answer).permit(:body, attachments_attributes: [:file])
  end

  def set_question
    @question = Question.find params[:question_id]
  end

  def set_answer
    @answer = Answer.find params[:id]
  end
end
