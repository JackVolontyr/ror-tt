class AnswersController < ApplicationController
  before_action :set_answer, only: [:update]
  before_action :answer_params
  before_action :set_question

  def create
    @answer = @question.answers.build answer_params
    @answer.user = current_user
    @answer.save
  end

  def update
    @answer.update(answer_params)
  end

  private
  def answer_params
    params.require(:answer).permit(:body)
  end

  def set_question
    @question = Question.find params[:question_id]
  end

  def set_answer
    @answer = Answer.find params[:id]
  end
end
