Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'

  get 'home', to: 'home#index'
  get 'home2', to: 'home2#index'
  get 'home3', to: 'home3#index'

end
