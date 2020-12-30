class CreateIos < ActiveRecord::Migration[5.2]
  def change
    create_table :ios do |t|

      t.timestamps
    end
  end
end
