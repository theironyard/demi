Rails.application.routes.draw do
  crud = %i( index create show update destroy )

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  get ':course/:timeline/:week', to: 'weeks#show'

  resources :courses, only: crud do
    resources :timelines, only: crud, shallow: true do
      resources :weeks, only: [:index, :show], shallow: true
    end
  end

  root to: 'courses#index'
end
