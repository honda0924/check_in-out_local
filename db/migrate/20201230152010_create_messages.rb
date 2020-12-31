class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :line_uid,null: false
      t.string :reply_token
      t.string :message_type
      t.text :message_text
      
      t.timestamps
    end
  end
end
