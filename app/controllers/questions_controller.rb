class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def show
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = current_user.questions.new question_params

    if @question.save
      redirect_to welcomes_path, flash: { notice: t(".new.success") }
    else
      render(:new)
    end
  end

  def update
    @question.update(question_params) ?
        redirect_to(@question) : render(:edit)
  end

  def destroy
    @question.destroy
    redirect_to question_path
  end

  private
  def set_question
    @question = Question.find params[:id]
  end

  def question_params
    params.require(:question).permit(:title, :body, :user_id)
  end
end
