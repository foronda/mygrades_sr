class Grade < ActiveRecord::Base
  belongs_to :course
  belongs_to :task
  belongs_to :student
  
  def self.per_page
  	10
  end
end
