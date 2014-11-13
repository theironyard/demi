Rails.application.routes.draw do
  crud = %i( index create show update destroy )

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  weekly_items = %i( assignments goals resources )

  resources :courses, only: crud do
    resources :timelines, only: crud, shallow: true
  end

  weekly_items.each do |item|
    resources item, only: [:show, :update, :destroy]
  end

  get ':course/:timeline/:week', to: 'weeks#show'
  weekly_items.each do |collection|
    post ":course/:timeline/:week/#{collection}", to: "weeks##{collection}"
  end

  root to: 'courses#index'
end
