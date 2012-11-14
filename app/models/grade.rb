class Grade < ActiveRecord::Base
  belongs_to :task
	belongs_to :student
	belongs_to :course
end
