Rails.application.routes.draw do
  devise_for :users
  root 'quizzes#index'
  resources :quizzes, except: [:index, :show]
  resources :users, only: :show
end
