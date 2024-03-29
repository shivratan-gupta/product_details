Rails.application.routes.draw do
  resources :products do
    collection do
      get 'export'
    end
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  

  root to: "products#index"
end
