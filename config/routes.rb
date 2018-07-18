Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :api do
        namespace :v1 do
          get 'complaint/index'
          get 'complaint/show'
          get 'complaint/create'
          get 'complaint/update'
        end
      end
    end
  end
  get 'complaint/index'
  get 'complaint/show'
  get 'complaint/create'
  get 'complaint/update'
  namespace :api do
    namespace :v1 do
      resources :test, :complaint
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
