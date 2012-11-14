class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :earned
      t.integer :total
      t.datetime :due

      t.timestamps
    end
  end
end
