Rails.application.routes.draw do
   devise_for :users, controllers: { 
    omniauth_callbacks: 'users/omniauth_callbacks' 
  }
   concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end
  root to: 'pages#home'
  get "/wordlists/new", to: "wordlists#showNew"
  get "/wordlists/learn", to: "wordlists#showLearn"
  resources :usercourses, concerns: :paginatable
  resources :profiles
  resources :pages do 
    # get "/page/create", action: "save_answer"
    member do
      post "save_answer"
    end
  end
  resources :wordlists 


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get '/dashboard' => 'users#dashboard'
  devise_scope :users do
    get "login" => "devise/sessions#new"
  end
  resources :users do
    member do
      get :following, :followers
    end
  end
   resources :relationships, only: [:create, :destroy]
end
