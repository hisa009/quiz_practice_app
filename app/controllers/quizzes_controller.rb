class QuizzesController < ApplicationController
  before_action :ensure_correct_user, only: [:destroy, :edit, :update]

  def index
    @quizzes = Quiz.all
    @quiz = @quizzes.sample
    gon.answer = @quiz.answer
    correctnesses = @quiz.correctnesses
    @rate = rate(correctnesses)
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
    correctnesses = @quiz.correctnesses
    @rate = rate(correctnesses)
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

  def rate(correctnesses)
    if correctnesses.length == 0
      return 0
    else
      quantity = correctnesses.length
      correct_count = 0
      correctnesses.each do |correctness|
        correct_count += 1 if correctness.answer_flg == true
      end
      return correct_count * 100 / quantity
    end
  end
end
