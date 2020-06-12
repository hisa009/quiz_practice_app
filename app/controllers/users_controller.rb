class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @quizzes = user.quizzes
  end
end
