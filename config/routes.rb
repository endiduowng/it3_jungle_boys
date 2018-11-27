Rails.application.routes.draw do
  resources :animes do
    resources :adds, only: [:create, :destroy], shallow: true
    resources :reviews
  end
  post '/rate' => 'rater#create', :as => 'rate'
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
  resources :reviews

  post "/search", to: "static_pages#result"
  get "/search", to: "static_pages#result"
  
  post "/sort_by_rating", to: "animes#sort_by_rating"

  get "/season", to: "animes#anime_list"

  get "/top", to: "animes#top"

  get "/admin", to: "animes#admin"

  get "/anime_airing_rank_list_view_more", to: "animes#anime_airing_rank_list"
  get "/anime_upcoming_rank_list_view_more", to: "animes#anime_upcoming_rank_list"
end
