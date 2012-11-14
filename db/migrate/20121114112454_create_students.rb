class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.references :course
      t.string :username

      t.timestamps
    end
    add_index :students, :course_id
  end
end
