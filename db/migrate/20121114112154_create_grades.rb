class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.references :task
      t.references :student
      t.references :category
      t.string :name
      t.integer :total
      t.datetime :duedate

      t.timestamps
    end
    add_index :grades, :task_id
    add_index :grades, :student_id
    add_index :grades, :category_id
  end
end
