require 'pry'
require 'csv'
require_relative 'filters'

include Filters


puts "EventManager initialized"

path = "./data/event_attendees.csv"

def output(row, fields)
  message = []
  fields.each do |one_field|
    if one_field == :zipcode
      message << zip_fixer(row[one_field])
    else
      message << row[one_field]
    end
  end
  message = message.join(" ")
  puts message
end

puts "Through enumerable as object"
CSV.open(path, headers:true, header_converters: :symbol) do |people|
  person = people.each
  person.select do |item|
    output(item, [:first_name, :zipcode])
  end
end
