class QuestionsController < ApplicationController
  before_action :set_question, only: [:edit, :update, :show, :destroy]

  def index
    @question = Question.all
    @question = Question.order(:subject).page params[:page]
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to :root
    else
      render 'new'
    end
  end

  def edit

  end

  def update
      if @question.update(question_params)
        redirect_to @question
      else
        render 'edit'
      end
  end

  def show
  end

  def destroy
    @question.destroy
    redirect_to :root
  end



  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:subject, :field)
  end

end
