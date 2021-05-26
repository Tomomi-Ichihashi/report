Rails.application.routes.draw do
  
  root to: 'users/homes#top'
  
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
}

devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
}

  namespace :admins do
    resources :users, except: [:destroy]
    resources :departments, except: [:new, :show,:destroy]
  end
  
  scope module: :users do
    resources :users, except: [:destroy, :new, :create]
    resources :clients, except: [:destroy] do
      resources :comments, only: [:create, :destroy]
    end
    resources :items do
      resource :checks, only: [:create, :destroy]
    end
    resources :events, only: [:create, :update, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
