Rails.application.routes.draw do
  resources :home
  resources :cards

  post 'battle/:id/user_attack', to:'home#user_attack', as: :user_attack
  post 'battle/:id/gym_leader_attack', to:'home#gym_leader_attack', as: :gym_leader_attack

  root to: "home#index"

  get '/users/fight', to: 'cards#index'

  get '/users', to: 'users#index'
  get '/battle/:id', to: 'home#show', as: :battle

  devise_for :users, controllers: {
	   sessions: 'users/sessions',
	   passwords: 'users/passwords',
	   registrations: 'users/registrations'
  }
end