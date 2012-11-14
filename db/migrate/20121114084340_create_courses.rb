class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :task_id
			t.string :name
      t.string :semester

      t.timestamps
    end
  end
end
