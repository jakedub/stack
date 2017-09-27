Rails.application.routes.draw do
  resources :votes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root
  root 'questions#index'
  # # index
  # get '/questions' => 'questions#index'
  # # new
  # get '/questions/new' => 'questions#new'
  # # show

  # # create
  # post '/questions/' => 'questions#create'
  # # edit
  # get '/questions/:id/edit' => 'questions#edit', as: :edit_questions
  # # update
  # put '/questions/:id' => 'questions#update'
  # # delete
  delete '/answers/delete/:id' => 'answers#destroy', as: :destroy_answer
  #delete user session
  get '/answers/toggle/:id' => 'answers#toggle', as: :toggle
  delete '/sessions' => 'sessions#destroy', as: :destroy_user_session


  # root to: 'sessions#new'
  resources :sessions, only: [:new, :create]
  resources :users

  # root 'questions#index'
  resources :questions do
    resources :answers, except: [:delete]
  end
end
