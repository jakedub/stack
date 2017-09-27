class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
def show

end

def new
  @answer = Answer.new
end

def edit

end

def update

  @answer.update(answer_params)
end

def create
  @question = Question.find(params[:question_id])
  @answer = @question.answers.new(answer_params)
  @answer.user = current_user
  @answer.correct = false
  if @question.answers << @answer
    redirect_to @question
  else
    redirect_to :root
  end
end

def toggle
    @answer = Answer.find(params[:id])
    @answer.toggle(:correct)
    @answer.save
    redirect_to @answer.question
end

def destroy
  @question = @answer.question
  @answer.destroy

  redirect_to @question
end

private
def set_answer
      @answer = Answer.find(params[:id])
    end

def answer_params
params.require(:answer).permit(:field, :correct)
end

end
