Rails.application.routes.draw do
  crud = %i( index create show update destroy )

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  get ':course/:timeline/:week', to: 'weeks#show'

  resources :courses, only: crud do
    resources :timelines, only: crud, shallow: true
  end

  root to: 'static#home'
end
