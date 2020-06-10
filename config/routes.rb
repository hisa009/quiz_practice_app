Rails.application.routes.draw do
  root 'quizzes#index'
  resources :quizzes, only: [:new, :create]
end
