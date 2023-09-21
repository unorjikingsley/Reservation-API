Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # namespace :api do
  #   namespace :v1 do
  #     resources :users, only: %i[index update show create destroy]
  #     resources :reservations, only: %i[index show update create destroy]
  #     resources :cars, only: %i[index update show create destroy]
  #   end
  # end

  # devise_for :users, controllers: {
  #   sessions: 'api/v1/sessions',
  #   registrations: 'api/v1/registrations'
  # }
end
