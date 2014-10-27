Rails.application.routes.draw do
  crud = %i( index create show update destroy )

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  resources :courses, only: crud

  root to: 'static#home'
end
