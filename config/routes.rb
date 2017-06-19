Rails.application.routes.draw do

  root 'pages#home'

  resources :pawns
  
  get 'pages/home'

  get 'pages/layaway'

  get 'pages/inventory'

  get 'pages/biker'

  get 'pages/contact'

  get 'pages/bigAndTall'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
