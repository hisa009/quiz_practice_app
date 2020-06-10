class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all
    @quiz = @quizzes.sample
  end

  def new
  end

  def create
  end
end
