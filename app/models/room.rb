class Room < ApplicationRecord
  has_many :room_users, dependent: :destroy
  #中間テーブルとroomsテーブルは多対多の関係であることを表している
  #親(room)が削除された時、子(room_users)も削除される。
  has_many :users, through: :room_users
  #usersテーブルとroomsテーブルは中間テーブルを介して(through)多対多の関係であることを表している
  has_many :messages, dependent: :destroy
  #一つのチャットルームには複数のメッセージが存在する
  #親(room)が削除された時、子(messages)も削除される。

  validates :name, presence: true

end
