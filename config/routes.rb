Rails.application.routes.draw do

  scope module: :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :listings
    end
  end

  root 'listings#index'
end
