Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :test
      resources :complaint do
        collection do
          post :generate_upload_url
          post :reply
        end
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
