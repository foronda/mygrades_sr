require 'spec_helper.rb'

describe Course do
  before :each do
    Course.create(:name=>"EE160s1", :semester=>"spring1 2012")
    Course.create(:name=>"EE160s2", :semester=>"spring2 2012")
    Course.create(:name=>"EE160s3", :semester=>"spring3 2012")
    Category.create(:name=>"homework")
    Category.create(:name=>"test")
    Team.create(:name=>"Geopro", :course_id=>1)
    Team.create(:name=>"Hamburger", :course_id=>0)
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

  describe "#size" do
    it "should have a size of 3" do
      @course = Course.all
      @course.size.should eql 3
    end
  end

  describe "tasks" do
    it "should have created 3 tasks" do
        @task = Task.all
        @task.size.should eql 3
    end
  end

  describe "teams" do
    it "should have created 2 teams" do
      @team = Team.all
      @team.size.should eql 2
    end
  end

  describe "find student" do
    it "should find tyler's id" do
      @student = Student.all
      @student.size.should eql 3
    end
  end

  # describe "upload" do
  #   it "should upload grades for tyler" do
  #     @grade = Grade.all
  #     Tempup.create(:upname=>"hw1")
  #     @grade.each do |g|
  #       if g.student_id == 3
  #         g.size.should eql 2
  #       end
  #     end
  #      gg.should eql 2
  #   end
  # end

end
