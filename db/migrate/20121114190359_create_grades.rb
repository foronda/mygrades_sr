class CreateGrades < ActiveRecord::Migration
  def change

     #drop_table :grades

    create_table :grades do |t|
      t.references :course
      t.references :task
      t.references :student
      t.integer :earned

      t.timestamps
    end
    add_index :grades, :course_id
    add_index :grades, :task_id
    add_index :grades, :student_id
  end
end
