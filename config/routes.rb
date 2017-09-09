Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'

  get 'tipo_de_usuário' => "pages#user_type", as: :user_type
  get 'test'  => "pages#test"

  resources :projects do
    member do
      put :change
    end
  end
end
