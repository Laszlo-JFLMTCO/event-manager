require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require './lib/output'
require 'sunlight/congress'
require 'csv'

class OutputTest < Minitest::Test
  include Output
  include Filters

  def test_legislator_list_by_zipcode
    test_zipcode = 80304
    assert_equal "Jared Polis, Cory Gardner, Michael Bennet", legislator_list(test_zipcode)
  end

  def test_output
    path = "./data/event_attendeesONEENTRY.csv"
    one_row = nil
    CSV.open(path, headers:true, header_converters: :symbol) do |people|
      person = people.each
      person.select do |item|
        one_row = item
      end
    end
    assert_equal "Allison 20010 [Eleanor Norton]", printout(one_row)
  end

end