require 'pry'
require 'csv'
require_relative 'filters'
require_relative 'output'
require 'sunlight/congress'

include Filters
include Output

puts "EventManager initialized"

# path = "./data/event_attendeesONEENTRY.csv"
path = "./data/event_attendees.csv"

path_letter_template = "./data/letter_template.erb"

puts "Through enumerable as object"
CSV.open(path, headers:true, header_converters: :symbol) do |people|
  person = people.each
  puts "Printing letters..."
  person.select do |one_person|
    printout(one_person, path_letter_template)
  end
end

puts "All done! :-)"
