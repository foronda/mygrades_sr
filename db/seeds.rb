# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Creates courses data
courses = [{:name => "EE 467", :semester => "Fall 2012"},
		   {:name => "EE 160", :semester => "Spring 2012"},
		   {:name => "EE 205", :semester => "Fall 2011"},
		   {:name => "EE 260", :semester => "Fall 2010"},]	

# Creates teams data
teams = [{:name => "SneakyRedondos", :course_id => Course.find_by_name("EE467").id},
		 {Teams.create :name => "Freshman FTW", :course_id => Course.find_by_name("EE467").id},
		 {Teams.create :name => "Hamburger", :course_id => Course.find_by_name("EE467").id},]
	
# Creates students data
students = [{:name => 'foronda', :course_id => Course.find_by_name("EE467").id, :team_id => Team.find_by_team_name("SneakyRedondos").id},
    	    {:name => 'rzukeran', :course_id => Course.find_by_name("EE467").id, :team_id => Team.find_by_team_name("SneakyRedondos").id},
		    {:name => 'bigtymler', :course_id => Course.find_by_name("EE467").id, :team_id => Team.find_by_team_name("Hamburger").id},
      	    {:name => 'flyingv', :course_id => Course.find_by_name("EE467").id, :team_id => Team.find_by_team_name("Hamburger").id},
      	    {:name => 'geopro', :course_id => Course.find_by_name("EE467").id, :team_id => Team.find_by_team_name("Freshman FTW").id},
      	    {:name => 'bigdang', :course_id => Course.find_by_name("EE467").id, :team_id => Team.find_by_team_name("Freshman FTW").id,]

# Creates categories data
categories = [{:name => "Homeworks", :weight => 0.2}, 
			  {:name => "Labs", :weight => 0.3}, 
			  {:name => "Midterms", :weight => 0.2}, 
			  {:name => "Final", :weight => 0.2},]
			  
# Inserts courses into database
courses.each do |course|
	Course.create!(course)

# Inserts categories into database
categories.each do |category|
	Category.create!(category)

# Inserts teams into database
teams.each do |team|
	Team.create!(team)
	
# Inserts students into database
students.each do |student|
  Student.create!(student)

end
