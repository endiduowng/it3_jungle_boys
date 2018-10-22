Rails.application.routes.draw do
  resources :animes do
    resources :adds, only: [:create, :destroy], shallow: true
  end
  root "animes#index"

  devise_for :users,
    path: '',
    path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
    controllers: {
      sessions: "users/sessions",
      registrations: "users/registrations",
      passwords: "users/passwords",
      confirmations: "users/confirmations"
    }
  resources :users, only: [:show]
end
