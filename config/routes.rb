Rails.application.routes.draw do
  devise_for :users
  root 'issues#index'
  resources :issues
end
