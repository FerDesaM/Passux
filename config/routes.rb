Rails.application.routes.draw do
  namespace :web do
    resources :users, only: [:new, :create] do
      member do
        get 'verify'
        post 'confirm_verification'
      end
    end

    root 'users#new' # Aquí debería apuntar a 'web/users#new' pero ya lo ajustaste.
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
