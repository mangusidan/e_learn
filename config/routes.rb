Rails.application.routes.draw do
  # get "user/show"
  root "static_pages#home"
  get "static_pages/home"
  get "user/:id" => "users#show", as: :user

  devise_for :users , :controllers => { registrations: 'users/registrations', 
                                        sessions:'users/sessions',
                                        omniauth_callbacks: 'users/omniauth_callbacks'}
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/users/edit' => 'devise/registrations#edit'
  end
  
  resources :users, only: [:index, :show]
  post 'users/follow', to: 'users#follow'
  delete 'users/unfollow', to: 'users#unfollow'
end
