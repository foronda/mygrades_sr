class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
			t.references :course
			t.references :category
      t.string :name
      t.integer :total
      t.datetime :due_date
			
      t.timestamps
    end
		add_index :tasks, :course_id
		add_index :tasks, :category_id
  end
end
