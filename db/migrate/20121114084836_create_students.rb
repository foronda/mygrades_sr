class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
			t.integer :course_id
      t.string :username
      t.timestamps
    end
  end
end
