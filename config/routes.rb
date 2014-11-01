Rails.application.routes.draw do
  crud = %i( index create show update destroy )

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  get ':course/:timeline/:week', to: 'weeks#show'
  %w( assignments goals resources ).each do |collection|
    post ":course/:timeline/:week/#{collection}", to: "weeks##{collection}"
  end

  resources :courses, only: crud do
    resources :timelines, only: crud, shallow: true
  end

  root to: 'courses#index'
end
