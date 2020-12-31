class CreateIos < ActiveRecord::Migration[5.2]
  def change
    create_table :ios do |t|
      t.references :student,foreign_key: true
      t.datetime :in_time
      t.datetime :out_time
      
      t.timestamps
    end
  end
end
