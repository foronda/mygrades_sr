class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :task_id
      t.string :name
      t.string :semester

      t.timestamps
    end
	
		#Populate Database with Different Courses for Dev Database
		Course.create :name => "EE467", :semester => "Fall 2012"
		Course.create :name => "EE260", :semester => "Fall 20111"
		Course.create :name => "EE205", :semester => "Spring 2012"
		Course.create :name => "EE160", :semester => "Spring 2011"
  end
end
