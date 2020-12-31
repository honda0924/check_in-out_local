class CreateLineusers < ActiveRecord::Migration[5.2]
  def change
    create_table :lineusers do |t|
      t.string :line_uid,null: false
      t.string :line_name
      t.references :student,foreign_key: true
      t.boolean :already_read
      t.timestamps
    end
  end
end
