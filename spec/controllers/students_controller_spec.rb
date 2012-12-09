require 'spec_helper.rb'

describe StudentsController do
 
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
end 