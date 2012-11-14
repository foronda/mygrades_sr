class Course < ActiveRecord::Base
	has_many :students
	has_many :grades
	has_many :tasks, :through => :grade
end
