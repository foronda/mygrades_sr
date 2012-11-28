class Student < ActiveRecord::Base
  belongs_to :course
   belongs_to :team
	has_many :grades
	has_many :tasks, :through => :grade
end
