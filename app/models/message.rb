class Message < ApplicationRecord
  belongs_to :room
  #一つのメッセージは一つのルームに存在する
  belongs_to :user
  #一つのメッセージは一つのユーザーから送られる

  has_one_attached :image

  validates :content, presence: true
  #からのメッセージはDBに保存されない(presence: trueとすることで保存をブロックしている)

  validates :content, presence: true, unless: :was_attached?
  #画像なしでもメッセージの投稿を可能にしている
  #画像が存在しなければテキストが必要となり、画像があればテキストは不要(画像、メッセージの両方が無いのはNG)

  def was_attached?
    self.image.attached?
  end
  #画像があればtrue、なければfalse

end
