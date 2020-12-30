class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :student_class
      t.string :student_name,null: false
      t.string :parent_name,null: false
      t.boolean :student_enabled
      

      t.timestamps
    end
  end
end
