class CreateTempups < ActiveRecord::Migration
  def change
    create_table :tempups do |t|
      t.string :upname

      t.timestamps
    end
  end
end
