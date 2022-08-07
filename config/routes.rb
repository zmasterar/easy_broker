# frozen_string_literal: true

Rails.application.routes.draw do
  resources :properties, only: %i[index show]

  root 'properties#index'
end
