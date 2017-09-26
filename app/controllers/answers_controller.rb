class AnswersController < ApplicationController
def show
  @answer = Answer.find(params[:id])
end

def new
  @answer = Answer.new
end

def edit
  @answer = Answer.find(params[:id])
end

def update
  @answer = Answer.find(params[:id])
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

private
def answer_params
params.require(:answer).permit(:field, :correct)
end

end
