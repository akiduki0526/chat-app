class Room < ApplicationRecord
  has_many :room_users
  #中間テーブルとroomsテーブルは多対多の関係であることを表している
  has_many :users, through: :room_users
  #usersテーブルとroomsテーブルは中間テーブルを介して(through)多対多の関係であることを表している
end
