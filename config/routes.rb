# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'data_centre#index'

  resources :devices, only: [:index, :update]
  resources :histogram, only: [:index]
end
