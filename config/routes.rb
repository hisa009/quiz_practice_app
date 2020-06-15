Rails.application.routes.draw do
  devise_for :users
  root 'quizzes#index2'
  resources :quizzes, except: :show
  resources :users, only: :show
end
