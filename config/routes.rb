Rails.application.routes.draw do

  resources :charges
  devise_for :admins
  root 'pages#home'
  resources :pawns do
    collection do
      get :payment
      post :search
    end
    resources :payments, shallow: true
  end
  
  get 'pages/layaway'

  get 'pages/inventory'

  get 'pages/biker'

  get 'pages/contact'

  get 'pages/bigAndTall'

  get 'pages/pawns'

  get 'pages/shopping'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
