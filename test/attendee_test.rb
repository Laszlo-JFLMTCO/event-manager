require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require './lib/attendee'
require './lib/filters'

class AttendeeTest < Minitest::Test
  include Filters

  #Filters module specific test cases
  def test_rubynizer
    assert_equal "regdate", rubynizer("RegDate")
    assert_equal "email_address", rubynizer("Email-Address")
  end

  #Attendee class specific test cases
  def test_initializing_no_template
    test_attendee = Attendee.new
    assert test_attendee
    assert_equal({}, test_attendee.all_details)
  end

  def test_initializing_with_template
    test_attendee = Attendee.new(["RegDate",
                                  "first_Name",
                                  "last_Name",
                                  "Email_Address"])
    assert_equal({"regdate"=>nil, "first_name"=>nil, "last_name"=>nil, "email_address"=>nil}, test_attendee.all_details)
    assert_nil test_attendee.detail("first_name")
    assert_nil test_attendee.detail("FirST-NaME")
  end

  def test_load_template
    test_attendee = Attendee.new
    test_attendee.load_template(["RegDate",
                                  "first_Name",
                                  "last_Name",
                                  "Email_Address"])
    assert_equal({"regdate"=>nil, "first_name"=>nil, "last_name"=>nil, "email_address"=>nil}, test_attendee.all_details)
    assert_nil test_attendee.detail("first_name")
    assert_nil test_attendee.detail("FirST-NaME")
  end

  def test_record_attendee_detail
    test_attendee = Attendee.new
    test_attendee.load_template(["RegDate",
                              "first_Name",
                              "last_Name",
                              "Email_Address"])
    test_input = "Testname"
    test_attendee.record("first_name", test_input)
    assert_equal test_input, test_attendee.detail("first_name")
    assert_equal test_input, test_attendee.detail("FirST-NaME")
  end

end