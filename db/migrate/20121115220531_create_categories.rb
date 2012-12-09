class CreateCategories < ActiveRecord::Migration
  def change
		create_table :categories do |t|
      t.string :name
      t.float :weight

      t.timestamps
    end
										
  end
end
