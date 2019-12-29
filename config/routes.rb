Rails.application.routes.draw do

  resources :movies, only: :index
  resources :seasons, only: :index
  resources :users, only: [] do
    member do
      get :library
      post 'purchase/:media_type/:media_id/:purchase_option_id' => 'users#purchase', constraints: { media_type: /season|movie/ }
    end
  end
  resources :media, only: :index
end
