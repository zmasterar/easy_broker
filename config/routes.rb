# frozen_string_literal: true

Rails.application.routes.draw do
  resources :properties, only: %i[index show]
  resources :leads, only: %i[create]

  root 'properties#index'
end
