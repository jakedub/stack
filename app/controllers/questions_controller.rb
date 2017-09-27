class QuestionsController < ApplicationController
  before_action :set_question, only: [:edit, :update, :show, :destroy]

  def index
    @question = Question.all
    @question = Question.order(totalcount: :DESC).page params[:page]
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
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

  def vote
      @question = Question.find(params[:question_id])
      @question.votes << Vote.create!(user_id: @question.user_id, question_id: @question.id)
      @question.totalcount = @question.votes.count
      @question.save
      redirect_to :root
    end

    def down_vote
      @question = Question.find(params[:question_id])
      @question.votes.last.destroy
      @question.totalcount = @question.votes.count
      @question.save
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
