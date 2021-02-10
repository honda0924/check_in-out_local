class CreateIostates < ActiveRecord::Migration[5.2]
  def change
    create_table :iostates do |t|
      t.references :student ,foregin_key: true
      t.integer :iostat ,null: false
      t.timestamps
    end
  end
end
