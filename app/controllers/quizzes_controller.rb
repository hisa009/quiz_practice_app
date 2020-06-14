class QuizzesController < ApplicationController
  before_action :ensure_correct_user, only: [:destroy, :edit, :update]

  def index
    @quizzes = Quiz.all
    @quiz = @quizzes.sample
  end

  def new
    @quiz = Quiz.new
  end

  def create
    quiz = Quiz.new(quiz_params)
    if quiz.save
      redirect_to root_path
      flash[:notice] = '投稿が完了しました'
    else
      flash.now[:alert] = '投稿に失敗しました'
      render :new
    end
  end

  def edit
  end

  def update
    if @quiz.update(quiz_params)
      redirect_to root_path
      flash[:notice] = '編集が完了しました'
    else
      flash.now[:alert] = '編集に失敗しました'
      render :edit
    end
  end

  def destroy
    @quiz.destroy
    redirect_to root_path
    flash[:notice] = '削除が完了しました'
  end

private
  def quiz_params
    params.require(:quiz).permit(:text, :answer).merge(user_id: current_user.id)
  end

  def ensure_correct_user
    @quiz = Quiz.find(params[:id])
    if @quiz.user_id != current_user.id
       flash[:notice] = '権限がありません'
       redirect_to root_path
    end
  end
end
