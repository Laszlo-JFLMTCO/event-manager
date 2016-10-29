module Filters
  def rubynizer(expression)
    expression.gsub!("-", "_")
    expression.chomp
    expression.gsub!("\n", "")
    expression.downcase
  end
end