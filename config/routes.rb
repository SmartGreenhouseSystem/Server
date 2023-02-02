# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'data_centre#index'

  resources :devices,   only: %i[index update]
  resources :histogram, only: %i[index]
  resources :api_keys,  only: %i[index create delete]
end
