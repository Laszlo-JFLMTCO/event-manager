require 'pry'
require 'csv'
require_relative 'filters'
require_relative 'output'
require 'sunlight/congress'

include Filters
include Output

puts "EventManager initialized"

path = "./data/event_attendees.csv"

puts "Through enumerable as object"
CSV.open(path, headers:true, header_converters: :symbol) do |people|
  person = people.each
  person.select do |item|
    puts printout(item)
  end
end
