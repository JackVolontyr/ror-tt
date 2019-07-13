class AnswersController < ApplicationController
  before_action :answer_params
  before_action :set_question

  def create
    @answer = @question.answers.build answer_params
    @answer.user = current_user
    @answer.save
    redirect_to welcomes_path
  end

  private
  def answer_params
    params.require(:answer).permit(:body)
  end

  def set_question
    @question = Question.find params[:question_id]
  end
end
