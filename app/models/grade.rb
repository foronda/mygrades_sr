class Grade < ActiveRecord::Base
  belongs_to :course
  belongs_to :task
  belongs_to :student
end
