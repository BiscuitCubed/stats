Rails.application.routes.draw do
  resources :players do
    resources :games
  end
  
  root 'players#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
