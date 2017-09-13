Rails.application.routes.draw do
  devise_for :testers, controllers: {
    sessions: 'testers/sessions' ,
    registrations: 'testers/registrations',
    passwords: 'testers/passwords'
  }

  devise_for :users, controllers: { 
    sessions: 'users/sessions' ,
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  root 'pages#home'

  get 'tipo_de_usuário' => "pages#user_type", as: :user_type
  get 'test'            => "pages#test"

  namespace :projects do
    resources :client_projects do
      member do
        put :change
      end
    end
    resources :worker_projects, only: [:index, :show]
  end
end
