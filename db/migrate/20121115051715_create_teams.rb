class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.references :course

      t.timestamps
    end
    add_index :teams, :course_id
  end
end
