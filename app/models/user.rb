class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  #nameがからの場合、DBに保存されない
  #validatesはDBに保存の規制をかけるメソッド
  #presence: trueは「空ではないか？」という意味

  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages
  #一人のユーザーから複数のメッセージが送られる

        end
