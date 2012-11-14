class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.references :task
			t.references :student
			t.references :course
			t.string 		 :letter
			t.integer 	 :earned
      t.timestamps
    end
    add_index :grades, :task_id
		add_index :grades, :student:id
		add_index :grades, :course:id
  end
end
