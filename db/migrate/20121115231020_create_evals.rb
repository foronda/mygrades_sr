class CreateEvals < ActiveRecord::Migration
  def change
    create_table :evals do |t|
      t.string :rating
      t.text :comments
      t.references :task
      t.references :team

      t.timestamps
    end
    add_index :evals, :task_id
    add_index :evals, :team_id
  end
end
