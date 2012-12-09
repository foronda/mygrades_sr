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

# Inserts courses into database
courses.each do |course|
	Course.create!(course)
end

# Creates categories data
categories = [{:name => "Homeworks", :weight => 0.2}, 
			  {:name => "Labs", :weight => 0.3}, 
			  {:name => "Midterms", :weight => 0.2}, 
			  {:name => "Final", :weight => 0.2},]	

# Inserts categories into database
categories.each do |category|
	Category.create!(category)
end

# Creates teams data
teams = [{:name => "Sneaky Redondos", :course_id => Course.find_by_name("EE 467").id},
		 {:name => "Freshman FTW", :course_id => Course.find_by_name("EE 467").id},
		 {:name => "Hamburger", :course_id => Course.find_by_name("EE 467").id},]

# Inserts teams into database
teams.each do |team|
	Team.create!(team)
end	

# Creates students data
students = [{:username => 'foronda', :course_id => Course.find_by_name("EE 467").id, :team_id => Team.find_by_name("Sneaky Redondos").id},
    	    {:username => 'rzukeran', :course_id => Course.find_by_name("EE 467").id, :team_id => Team.find_by_name("Sneaky Redondos").id},
		    {:username => 'bigtymler', :course_id => Course.find_by_name("EE 467").id, :team_id => Team.find_by_name("Hamburger").id},
      	    {:username => 'flyingv', :course_id => Course.find_by_name("EE 467").id, :team_id => Team.find_by_name("Hamburger").id},
      	    {:username => 'geopro', :course_id => Course.find_by_name("EE 467").id, :team_id => Team.find_by_name("Freshman FTW").id},
      	    {:username => 'bigdang', :course_id => Course.find_by_name("EE 467").id, :team_id => Team.find_by_name("Freshman FTW").id},]
			  
# Inserts students into database
students.each do |student|
  Student.create!(student)
end
