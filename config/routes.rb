TextualSatisfaction::Application.routes.draw do
  root to: 'messages#index'

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
  resources :messages
  resources :contact
end
