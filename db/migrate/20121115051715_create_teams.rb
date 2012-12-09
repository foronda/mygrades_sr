class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.references :course

      t.timestamps
    end
    add_index :teams, :course_id
	
	#Populate Database with teams for the course EE467
	Teams.create :name => "SneakyRedondos", :course_id => Course.find_by_name("EE467").id
	Teams.create :name => "Freshman FTW", :course_id => Course.find_by_name("EE467").id
	Teams.create :name => "Hamburger", :course_id => Course.find_by_name("EE467").id
  end
end
