$h_total = 0
$h_earned = 0

class Student < ActiveRecord::Base
  belongs_to :course
   belongs_to :team
	has_many :grades
	has_many :tasks, :through => :grade
end
