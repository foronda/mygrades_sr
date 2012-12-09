class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.references :course
       t.references :team
      t.string :username

      t.timestamps
    end
    add_index :students, :course_id		# Creates a has many relationship from course -> students
    add_index :students, :team_id		# Adds a has many relationship from team -> students
  end
end
