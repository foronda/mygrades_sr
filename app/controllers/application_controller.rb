class ApplicationController < ActionController::Base
  protect_from_forgery
end

class Numeric
  def percent_of(n)
    self.to_f / n.to_f * 100.0
  end
end
