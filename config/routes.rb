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
  end

 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
