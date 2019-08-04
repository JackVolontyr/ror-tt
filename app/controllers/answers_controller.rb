class AnswersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_answer, except: [:create]
  before_action :set_question, only: [:create, :destroy, :update]

  def create
    @answer = @question.answers.build answer_params
    @answer.user = current_user
    @answer.save
=begin
    respond_to do |format|
      if @answer.save
        # format.html { render partial: 'answers/answers', layout: false }
        format.json { render json: @answer }
      else
        # format.html { render partial: 'answers/error_explanation',
        #                      status: :unprocessable_entity, # 422
        #                      layout: false }
        format.json { render json: @answer.errors,
                             status: :unprocessable_entity }
      end
    end
=end
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
