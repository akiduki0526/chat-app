class CreateRoomUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :room_users do |t|
      t.references :room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      #外部キー(room,user)をテーブルに追加
      #補足：referencesは外部キーを引っ張れるコード
      t.timestamps
    end
  end
end
