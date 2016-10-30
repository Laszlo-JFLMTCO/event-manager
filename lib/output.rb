require 'pry'
require_relative 'filters'
module Output
  include Filters

  def legislator_list(zipcode)
    Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

    legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)
      legislators.map do |one_legislator|
        "#{one_legislator.first_name} #{one_legislator.last_name}"
      end.join(", ")
  end

  def printout(row)
    zipcode = zip_fixer(row[:zipcode])
    "#{row[:first_name]} #{zipcode} [#{legislator_list(zipcode)}]"
  end

end