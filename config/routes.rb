Rails.application.routes.draw do
  resources :roles
  resources :locations, only: [:index, :edit, :show, :update, :destroy]
  resources :countries
  resources :users do
    resources :locations, only: [:index, :create, :new]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
