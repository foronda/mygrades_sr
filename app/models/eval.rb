class Eval < ActiveRecord::Base
  belongs_to :Task
  belongs_to :Team
  
  RATINGS = ['Excellent', 'Very Good', 'Satisfactory', 'Ordinary', 'Marginal', 'Deficient', 'Unsatisfactory', 'Superficial', 'No Show']
end
