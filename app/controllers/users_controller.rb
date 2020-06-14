class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    if user.id != current_user.id
      flash[:notice] = '権限がありません'
      redirect_to root_path
    end
    @quizzes = user.quizzes
  end
end
