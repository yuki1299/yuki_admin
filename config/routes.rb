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

  root 'home#index'

  get 'tipo_de_usuário' => "pages#user_type", as: :user_type
  get 'pagamento'       => "payment#index", as: :payment

  resources :projects do
    resources :asks
    resources :tasks
    resources :publics
    resources :credits
    get 'roteiro'         => "script#list", as: :script
    get 'resultados'      => "results#list", as: :results
    member do
      put :change
    end
  end
  resources :worker_projects, only: [:index, :show]
end
