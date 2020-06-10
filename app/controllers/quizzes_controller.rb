class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all
    @quiz = @quizzes.sample
  end

  def new
  end

  def create
    quiz = Quiz.new(params_quiz)
    if quiz.save
      redirect_to root_path
      flash[:notice] = '投稿が完了しました'
    else
      flash.now[:alert] = '投稿に失敗しました'
      render :new
    end
  end

private
  def params_quiz
    params.permit(:text, :answer)
  end
end
