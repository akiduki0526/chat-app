class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string  :content
      #投稿文書
      t.references :room, null: false, foreign_key: true
      #room_id(外部キー)
      t.references :user, null: false, foreign_key: true
      #user_id(外部キー)

      t.timestamps
    end
  end
end
