class AddColumnToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :already_read, :boolean
    add_reference :messages, :student, foreign_key: true
  end
end
