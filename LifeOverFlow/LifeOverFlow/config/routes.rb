LifeOverFlow::Application.routes.draw do

  root :to => 'questions#index'

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"

  resources :questions do
    resources :answers
  end

resources :questions, :comments, :answers do
  resources :votes
end

  resources :comments
  resources :users
  resources :sessions
end
