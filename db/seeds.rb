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
			  {:name => "Midterms", :weight => 0.3}, 
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

# Creates tasks for a course
tasks =[{:name => "Hw1", :course_id => Course.find_by_name("EE 467").id, :category_id => Category.find_by_name("Homeworks").id, :total => 20, :due_date => "2012-09-14 23:59"}, 
		{:name => "Hw2", :course_id => Course.find_by_name("EE 467").id, :category_id => Category.find_by_name("Homeworks").id, :total => 20, :due_date => "2012-09-28 23:59"},
		{:name => "Hw3", :course_id => Course.find_by_name("EE 467").id, :category_id => Category.find_by_name("Homeworks").id, :total => 20, :due_date => "2012-10-15 23:59"},
		{:name => "Lab1", :course_id => Course.find_by_name("EE 467").id, :category_id => Category.find_by_name("Labs").id, :total => 20, :due_date => "2012-09-03 23:59"},
		{:name => "Lab2", :course_id => Course.find_by_name("EE 467").id, :category_id => Category.find_by_name("Labs").id, :total => 20, :due_date => "2012-10-01 23:59"},
		{:name => "Midterm1", :course_id => Course.find_by_name("EE 467").id, :category_id => Category.find_by_name("Midterms").id, :total => 100, :due_date => "2012-10-31 12:45"},
		{:name => "Midterm2", :course_id => Course.find_by_name("EE 467").id, :category_id => Category.find_by_name("Midterms").id, :total => 100, :due_date => "2012-11-16 12:30"},
		{:name => "Final", :course_id => Course.find_by_name("EE 467").id, :category_id => Category.find_by_name("Final").id, :total => 200, :due_date => "2012-12-10 12:30"},]

# Inserts tasks into database
tasks.each do |task|
	Task.create!(task)
end