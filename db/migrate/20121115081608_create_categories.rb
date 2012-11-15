class CreateCategories < ActiveRecord::Migration
  def change
		create_table :categories do |t|
      t.string :name
      t.float :weight

      t.timestamps
    end
		
		#Populate Database with Typical Categories
		Category.create :name => "Homeworks", :weight => 0.2
		Category.create :name => "Labs", :weight => 0.3
		Category.create :name => "Midterms", :weight => 0.3
		Category.create :name => "Final", :weight => 0.2									
  end
end
