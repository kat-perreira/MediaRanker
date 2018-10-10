Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'homepages#index'

  resources :votes, :works

  resources :works do
    resources :votes
  end

  resources :users do
    resources :votes
  end


  resources :homepages, only: [:index]


end
