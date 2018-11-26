Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tests#index'

  resources :tests do
    resources :questions, shallow: true
  end

  post '/questions' => 'questions#create'
end
