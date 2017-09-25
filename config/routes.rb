Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root
  # root 'questions#index'
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
  # delete '/questions/:id' => 'questions#destroy'

  root 'questions#index'
  resources :questions
end
