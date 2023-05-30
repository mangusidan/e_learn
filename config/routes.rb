Rails.application.routes.draw do
  root "static_pages#home"
  get "static_pages/home"
  devise_for :users , :controllers => { registrations: 'users/registrations', 
                                        sessions:'users/sessions',
                                        omniauth_callbacks: 'users/omniauth_callbacks'}
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
