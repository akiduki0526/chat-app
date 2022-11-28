class Message < ApplicationRecord
  belongs_to :room
  #一つのメッセージは一つのルームに存在する
  belongs_to :user
  #一つのメッセージは一つのユーザーから送られる

  has_one_attached :image

  validates :content, presence: true
  #からのメッセージはDBに保存されない(presence: trueとすることで保存をブロックしている)

end
