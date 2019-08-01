class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def show
    @answer = @question.answers.build
  end

  def new
    @question = Question.new
    @attachment = @question.attachments.build
  end

  def edit
    @attachment = @question.attachments.build
  end

  def create
    @question = current_user.questions.new question_params

    if @question.save
      redirect_to welcomes_path, flash: { notice: t(".new.success") }
    else
      redirect_to welcomes_path, flash: { errors: @question.errors }
    end
  end

  def update
    @question.update question_params
  end

  def destroy
    @question.destroy
    redirect_to welcomes_path

    # TODO: js: true
    # @questions = Question.all
  end

  private
  def set_question
    @question = Question.find params[:id]
  end

  def question_params
    params.require(:question).permit(:title, :body, attachments_attributes: [:file])
  end
end
