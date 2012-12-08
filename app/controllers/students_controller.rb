class StudentsController < ApplicationController
  # GET /students
  # GET /students.json
	
	helper_method :homework_weight
	before_filter :get_homework_earned
	
	def get_homework_earned
		@homework_earned = session[:h_earned]
	end
	
	def homework_weight
		@h_weight = Category.find_by_id(1).weight
	end
  
	def index
    @students = Student.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @students }
    end
  end
	
  # GET /students/1
  # GET /students/1.json
  def show
    @student = Student.find(params[:id])
		@course = Course.find(@student.course_id)
		@team = Team.find(@student.team_id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student }
    end
  end

  # GET /students/new
  # GET /students/new.json
  def new
    @student = Student.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student }
    end
  end

  # GET /students/1/edit
  def edit
    @student = Student.find(params[:id])
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(params[:student])

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render json: @student, status: :created, location: @student }
      else
        format.html { render action: "new" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /students/1
  # PUT /students/1.json
  def update
    @student = Student.find(params[:id])

    respond_to do |format|
      if @student.update_attributes(params[:student])
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :no_content }
    end
  end

  def upload_student
    stu = Array.new
    cour = Array.new
    table = Array.new
    na = 0
    file = params[:student_file]
    fname = file.original_filename
    fname = fname.split('.')
    file.read.split.each do |part|
      stu << part
    end
    @course = Course.all
    @team = Team.all
      #search for a nil team to add students to
      @course.each do |c|
        if c.name == fname[0]
          @team.each do |t|
            if t.name == 'NA' && t.course_id == c.id
              na = 1
            end
          end
        end
      end
      #if there is no nil team, add it
      if na == 0
        @course.each do |c|
          if c.name == fname[0]
            Team.create(:name => 'NA', :course_id => c.id)
          end
        end
        na = 1
      end
      #add students to nil team
      @team = Team.all
      if na == 1
        @course.each do |c|
          if c.name == fname[0]
            @team.each do |t|
              if t.name == 'NA' && t.course_id == c.id
                stu.each do |s|
                  Student.create(:course_id => c.id, :team_id => t.id, :username => s)
                end
              end
            end
          end
        end
      end
    #table.each_with_index do |ta, d|
      #if d%2 == 0
        #cour << ta
      #else
        #stu << ta
      #end
    #end
    redirect_to students_path
  end
	
	before_filter :load_hearned
  after_filter :save_hearned

  private
    def load_hearned
      @hearned = session[:hearned] || 0
    end

    def save_hearned
      session[:hearned] = @hearned
    end

	
	before_filter :load_hearned
  after_filter :save_hearned

end
