Rails.application.routes.draw do

  scope module: :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :listings do
        resources :attachments
      end
    end
  end

  root 'api/v1/listings#index'
end
