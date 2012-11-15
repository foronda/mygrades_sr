class CreateCategories < ActiveRecord::Migration
  def change
    drop_table :categories
		create_table :categories do |t|
      t.string :name
      t.float :weight

      t.timestamps
    end
  end
end
