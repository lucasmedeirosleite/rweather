# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  namespace :api do
    api_version(module: 'V1',
                header: { name: 'Accept', value: 'application/vnd.rweather.com; version=1' }) do

      resources :cities, only: [] do
        collection do
          get :random
          get :search
        end
      end
    end
  end
end
