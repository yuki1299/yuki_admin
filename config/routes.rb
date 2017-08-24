Rails.application.routes.draw do
  resources :projects
  devise_for :users
  root 'pages#home'

  get 'about' => "pages#about"
end
