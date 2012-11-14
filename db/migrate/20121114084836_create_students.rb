class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :username

      t.timestamps
    end
  end
end
