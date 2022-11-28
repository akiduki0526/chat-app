class RoomUser < ApplicationRecord
  
  belongs_to :room
  belongs_to :user

  #中間ファイルのデータとrooms、usersは一対一の関係であることを示している

end
