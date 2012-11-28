# Generated using:
# rails generate scaffold Teams name:string course:references

class Team < ActiveRecord::Base
   belongs_to :course
   has_many :students
end
