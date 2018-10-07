Rails.application.routes.draw do
  resources :animes
  root 'static_pages#home'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",
    passwords: "users/passwords",
    confirmations: "users/confirmations"
  }
end
