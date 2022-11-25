Rails.application.routes.draw do
  devise_for :users
  get 'messages/index'
  root to: "rooms#index"
  resources :users, only: [:edit, :update]
  #usersルートにeditとupdateアクションを追加
  resources :rooms, only: [:new, :create]
  

end
