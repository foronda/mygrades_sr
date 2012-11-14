class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.string :letter
      t.references :task

      t.timestamps
    end
    add_index :grades, :task_id
  end
end
