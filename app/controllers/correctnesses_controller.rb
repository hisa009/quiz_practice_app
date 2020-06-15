class CorrectnessesController < ApplicationController
  def create
    Correctness.create(correctness_params)
  end
end

private
def correctness_params
  quiz = Quiz.find(params[:quiz_id])
  if quiz.answer == params[:text]
    params.permit(:quiz_id).merge(answer_flg: true)
  else
    params.permit(:quiz_id).merge(answer_flg: false)
  end
end