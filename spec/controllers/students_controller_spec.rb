require 'spec_helper.rb'

describe StudentsController do
 #  before :each do
	# students = [{:username => 'foronda', :course_id => Course.find_by_name("EE 467").id, :team_id => Team.find_by_name("Sneaky Redondos").id},
 #            {:username => 'rzukeran', :course_id => Course.find_by_name("EE 467").id, :team_id => Team.find_by_name("Sneaky Redondos").id},
 #            {:username => 'bigtymler', :course_id => Course.find_by_name("EE 467").id, :team_id => Team.find_by_name("Hamburger").id},
 #            {:username => 'flyingv', :course_id => Course.find_by_name("EE 467").id, :team_id => Team.find_by_name("Hamburger").id},
 #            {:username => 'geopro', :course_id => Course.find_by_name("EE 467").id, :team_id => Team.find_by_name("Freshman FTW").id},
 #            {:username => 'bigdang', :course_id => Course.find_by_name("EE 467").id, :team_id => Team.find_by_name("Freshman FTW").id},]
 #  end
  # describe "courses" do
  #   it "should have a size of 1" do
  #     @course = Course.all
  #     @course.size.should eql 1
  #   end
  # end
   		

	# describe get_homework_earned do
	# 	it 'should belong to a course'
	# end

  def mock_student(stubs={})
    @mock_student ||=mock_model(Student,stubs).as_null_object
  end

  describe "GET index" do 
    it "assign all students as @products" do
      Student.stub(:all) {[mock_student]}
      get :index
      assigns(:students).should eq([mock_student])
    end
  end

  describe "PUT update" do
    it "redirects to the student" do
      Student.stub(:find) {mock_student(:update_attributes => true)}
      put :update, :id => "1"
      response.should redirect_to(student_url(mock_student))
    end
  end

  describe "POST create" 
    context "with valid attributes" do
      it "creates the student" do
        Student.stub(:new) { mock_student(:save => true)}
        post :create, :student => {}
        response.should redirect_to(student_url(mock_student))
      end
    end

  describe "DELETE destroy" do
    it "destroys the student" do
      Student.stub(:find) {mock_student(:find => true)}
      delete :destroy, :id => "1"
      response.should redirect_to students_url
    end
  end


    # it "assigns @students" do
    #   student = Student.new
    #   response.should render_template("new")
    #   #assigns(:students).should eq([student])
    # end	
end 