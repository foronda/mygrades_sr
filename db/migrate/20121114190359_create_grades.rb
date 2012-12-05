class CreateGrades < ActiveRecord::Migration
  def change
<<<<<<< HEAD
=======

     #drop_table :grades

>>>>>>> 175ee1b65cfcf95602954802c35750fdc71bfafc
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
