class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all
    @quiz = @quizzes.sample
  end
end
