Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users

  get 'invite_friend/:id', to: 'users#invite_friend', as: :invite_friend
  get 'confirm_friend/:id', to: 'users#confirm_friend', as: :confirm_friend
  get 'pending_friends', to: 'users#pending_friends', as: :pending_friends
  resources :users, only: %i[index show]
  resources :posts, only: %i[index create] do
    resources :comments, only: [:create]
    resources :likes, only: %i[create destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
