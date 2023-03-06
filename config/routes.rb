Rails.application.routes.draw do
  devise_for :users
  # root to: "pages#home"
  root to: "activity_lists#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :activity_lists, only: %i[index show] do
    resources :runnings, except: %i[destroy]
    resources :winter_sports, except: %i[destroy]
    resources :cyclings, except: %i[destroy]
    resources :swimmings, except: %i[destroy]
    resources :walkings, except: %i[destroy]
  end
  resources :runnings, only: %i[destroy]
  resources :winter_sports, only: %i[destroy]
  resources :cyclings, only: %i[destroy]
  resources :swimmings, only: %i[destroy]
  resources :walkings, only: %i[destroy]
  get "stats/:id", to: "activity_lists#stats", as: "coustom"
end
