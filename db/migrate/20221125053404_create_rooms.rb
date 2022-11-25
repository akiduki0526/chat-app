class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      #ルーム名をテーブルに追加。空白(null)の場合、falseを返す。
      t.timestamps
    end
  end
end
