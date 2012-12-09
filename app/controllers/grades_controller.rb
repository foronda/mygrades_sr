class GradesController < ApplicationController
  # GET /grades
  # GET /grades.json
  def index
    @grades = Grade.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @grades }
    end
  end

  # GET /grades/1
  # GET /grades/1.json
  def show
    @grade = Grade.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @grade }
    end
  end

  # GET /grades/new
  # GET /grades/new.json
  def new
    @grade = Grade.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @grade }
    end
  end

  # GET /grades/1/edit
  def edit
    @grade = Grade.find(params[:id])
  end

  # POST /grades
  # POST /grades.json
  def create
    @course = Course.find(params[:course_id])
    #@grade = Grade.new(params[:grade])
  end

  # PUT /grades/1
  # PUT /grades/1.json
  def update
    @grade = Grade.find(params[:id])

    respond_to do |format|
      if @grade.update_attributes(params[:grade])
        format.html { redirect_to @grade, notice: 'Grade was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grades/1
  # DELETE /grades/1.json
  def destroy
    @grade = Grade.find(params[:id])
    @grade.destroy

    respond_to do |format|
      format.html { redirect_to grades_url }
      format.json { head :no_content }
    end
  end

  def upload_grade
    @grade = Grade.all
    stu = Array.new
    val = Array.new
    table = Array.new
    file = params[:grade_file]
    fname = file.original_filename
    fname = fname.split('.')
    file.read.split.each do |part|
      table << part
    end
    table.each_with_index do |ta, d|
      if d%2 == 0
        stu << ta
      else
        val << ta
      end
    end
    @course = Course.all
    @task = Task.all
    @student = Student.all
    #once for each student
    stu.each_with_index do |sid, dex|
      @student.each do |s|
        if s.username == sid
          @course.each do |c|
            @task.each do |t|
              if t.name == fname[0] && t.course_id == s.course_id && s.course_id == c.id
                Grade.create(:course_id => c.id, :task_id => t.id, :student_id => s.id, :earned => val[dex])
              end
            end
          end
        end
      end
    end
    redirect_to grades_path
  end
end
