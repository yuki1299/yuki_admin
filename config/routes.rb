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
  get 'tipo_de_usuário_login' => "home#user_login_type", as: :user_login_type
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

  get 'worker_projects/project/:id/tasks' => 'worker_projects/tasks#index', as: :worker_projects_tasks
  get 'worker_projects/project/:project_id/tasks/:id' => 'worker_projects/tasks#answer', as: :worker_projects_tasks_opened
  post 'worker_projects/project/:project_id/tasks/:id/answer/:id' => 'worker_projects/tasks#answer_create', as: :create_answer
  get 'worker_projects/project/:project_id/asks/:id' => 'worker_projects/asks#answer', as: :worker_projects_asks_opened
  post 'worker_projects/project/:project_id/asks/:id/answer/:id' => 'worker_projects/asks#answer_create', as: :create_answer_ask

  post 'worker_projects/project/:id' => 'worker_projects/tasks#finish_test', as: :finish_test
end
