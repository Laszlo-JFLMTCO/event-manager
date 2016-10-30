module Filters
  def rubynizer(expression)
    expression.gsub!("-", "_")
    expression.chomp
    expression.gsub!("\n", "")
    expression.downcase
  end

  def zip_fixer(zip_code)
    zip_code.to_s[0..4].rjust(5, "0")
  end
end