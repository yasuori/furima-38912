Rails.application.routes.draw do
  root to: 'emails#index.html.erb'
  resources :emails, only: :index
end