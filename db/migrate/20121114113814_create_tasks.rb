class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :course
      t.integer :category_id
      t.string :name
      t.integer :total
      t.datetime :due_date

      t.timestamps
    end
    add_index :tasks, :course_id
  end
end
