class CreateLineusers < ActiveRecord::Migration[5.2]
  def change
    create_table :lineusers do |t|

      t.timestamps
    end
  end
end
