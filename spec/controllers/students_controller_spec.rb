require 'spec_helper.rb'

describe StudentsController do
	before :all do
   		Course.create(:name=>"EE160s1", :semester=>"spring1 2012")
    	Course.create(:name=>"EE160s2", :semester=>"spring2 2012")
    	Course.create(:name=>"EE160s3", :semester=>"spring3 2012")
    	Category.create(:name=>"homeworks", :weight=>0.2)
    	Category.create(:name=>"labs", :weight=>0.3)
    	Category.create(:name=>"midterms", :weight=>0.3)
    	Category.create(:name=>"final", :weight=>0.2)
    	Team.create(:name=>"Geopro", :course_id=>1)
    	Team.create(:name=>"Hamburger", :course_id=>0)
    	Team.create(:name=>"Sneaky Redondos", :course_id=>2)
    	@course = Course.all
    	@course.each do |c|
      		cid = c.id
      		@category = Category.all
      		@category.each do |cat|
        		if cat.name == "homework"
          			catid = cat.id
          			Task.create(:course_id=>cid, :category_id=>catid, :name=>"hw1", :total=>100, :due_date=>2012-1-10)
        		end
      		end
    	end
    	@team = Team.all
    	@team.each do |t|
      		if t.name == "Geopro"
          		Student.create(:course_id=>t.course_id, :team_id=>t.id, :username=>"jon")
          		Student.create(:course_id=>t.course_id, :team_id=>t.id, :username=>"geoffrey")
      		end
      		if t.name == "Hamburger"
          		Student.create(:course_id=>t.course_id, :team_id=>t.id, :username=>"tyler")
      		end
    	end
  	end

	# describe get_homework_earned do
	# 	it 'should belong to a course'
	# end

	
end 