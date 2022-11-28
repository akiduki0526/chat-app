Rails.application.routes.draw do
  devise_for :users
  get 'messages/index'
  root to: "rooms#index"
  resources :users, only: [:edit, :update]
  #usersルートにeditとupdateアクションを追加
  resources :rooms, only: [:new, :create, :destroy] do
    resources :messages, only: [:index, :create]
    #どのルームから送られたメッセージかを判定させたいから親子関係にする
    #補足：ルーティングのネスト(roomsが親、messagesが子)
    #親(rooms)を削除したらmessagesも削除される
  end
end
