Rails.application.routes.draw do

  devise_for :admins
  root 'pages#home'

  resources :pawns do
    member do
      get :search
    end
    resources :payments, shallow: true
  end
  
  get 'pages/home'

  get 'pages/layaway'

  get 'pages/inventory'

  get 'pages/biker'

  get 'pages/contact'

  get 'pages/bigAndTall'

  get 'pages/pawns'

  get 'pages/shopping'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
