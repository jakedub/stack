class QuestionsController < ApplicationController

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
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
      if @question.update(question_params)
        redirect_to @question
      else
        render 'edit'
      end
  end

  def show
      @question = Question.find(params[:id])
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to :root
  end

  private

  def question_params
    params.require(:question).permit(:subject, :field)
  end

end
