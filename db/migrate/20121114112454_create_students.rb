class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.references :course
       t.references :team
      t.string :username

      t.timestamps
    end
    add_index :students, :course_id
     add_index :students, :team_id
  end
end
