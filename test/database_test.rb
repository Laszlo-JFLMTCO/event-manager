require 'simplecov'
SimpleCov.start
require'pry'
require 'minitest/autorun'
require './lib/database'

class DataBaseTest < Minitest::Test

  # def test_initialize_no_path
  #   assert(DataBase.new)
  #   assert_empty DataBase.new.content
  # end

  # def test_initialize_with_path_file_not_exist
  #   test_data = DataBase.new("./data/", "non_existent.csv")
  #   assert_empty DataBase.new.content
  # end

  def test_initialize_with_path_file_exist
    test_data = DataBase.new("./data/", "event_attendees.csv")
    
    assert_equal [], test_data.content.headers
    binding.pry
  end

  # def test_initialize_with_either_path_or_csv_file_but_not_both
  #   test_data = Data.new
  #   assert_empty Data.new.raw_content  
  # end

  # def test_import_file_small_attendee_list
  #   test_data = Data.new
  #   test_data.import("./data/", "event_attendees.csv")
  #   assert test_data.raw_content[0].include?("1,")
  #   assert_equal "Allison", test_data.list[0].detail("First_NAME")
  # end

  # def test_import_file_complete_attendee_list
  #   test_data = Data.new
  #   test_data.import("./data/", "full_event_attendees.csv")
  #   assert test_data.raw_content[0].include?("1,")
  #   assert_equal "Allison", test_data.list[0].detail("First_NAME")
  # end

  # def test_list_first_name_zip_code_single_entry_csv
  #   test_data = Data.new
  #   test_data.import("./data/", "event_attendeesONEENTRY.csv")
  #   assert_equal ["Allison 20010"], test_data.list_all(["First_NAME", "ziPCODe"])
  # end

  # def test_list_city_first_zip_name_zip_code_single_entry_csv
  #   test_data = Data.new
  #   test_data.import("./data/", "event_attendees.csv")
  #   test_expected_output = ["Washington 20010 Allison 20010", "Washington 20009 SArah 20009", "Saint Petersburg 33703 Sarah 33703", "Jersey City 7306 David 7306", "Ottawa  Chris ", "Vancouver 90210 Aya 90210", "Baltimore 21230 Mary Kate 21230", "Placerville 95667 Audrey 95667", "Kailua 96734 Shiyu 96734", "La Jolla 92037 Eli 92037", "attleboro 2703 Colin 2703", "Columbus 43201 Megan 43201", "Piedmont 94611 Meggie 94611", "San Juan 924 Laura 924", "Tehran 14517 Paul 14517", "Lyndeborough 3082 Shannon 3082", "Seattle 98122 Shannon 98122", "Seattle 98122 Nash 98122", "Valois 14841 Amanda 14841"]
  #   assert_equal test_expected_output, test_data.list_all(["cITY", "ZiPCodE", "First_NAME", "ziPCODe"])
  # end

end