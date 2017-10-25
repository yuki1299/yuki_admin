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

  get 'tipo_de_usuário'       => "home#user_type", as: :user_type
  get 'pagamento'             => "payment#index", as: :payment

  get 'tester_completo'       => "register_confirmation#complete_tester", as: :complete_tester
  get 'tester_fail'           => "register_confirmation#fail_tester", as: :fail_tester
  get 'user_completo'         => "register_confirmation#complete_user", as: :complete_profissional
  

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
