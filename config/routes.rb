Rails.application.routes.draw do
  resources :songs
  resources :albums
  resources :accounts
  resources :users

    devise_for :users,
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               registration: 'signup'
             }
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
