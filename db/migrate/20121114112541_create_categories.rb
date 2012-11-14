class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.references :task
      t.string :type

      t.timestamps
    end
    add_index :categories, :task_id
  end
end
