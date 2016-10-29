module Filters
  def rubynizer(expression)
    expression.gsub!("-", "_")
    expression.downcase
  end
end