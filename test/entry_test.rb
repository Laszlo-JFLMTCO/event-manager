require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require './lib/entry'
require './lib/filters'

class EntryTest < Minitest::Test
  include Filters

  def test_initializing_no_template
    test_entry = Entry.new
    assert test_entry
    assert_equal({}, test_entry.details)
  end

  def test_initializing_with_template
    test_entry = Entry.new(["RegDate",
                                  "first_Name",
                                  "last_Name",
                                  "Email_Address"])
    assert_equal({"regdate"=>nil, "first_name"=>nil, "last_name"=>nil, "email_address"=>nil}, test_entry.details)
    assert_nil test_entry.detail("first_name")
    assert_nil test_entry.detail("FirST-NaME")
  end

  def test_load_template
    test_entry = Entry.new
    test_entry.load_template(["RegDate",
                                  "first_Name",
                                  "last_Name",
                                  "Email_Address"])
    assert_equal({"regdate"=>nil, "first_name"=>nil, "last_name"=>nil, "email_address"=>nil}, test_entry.details)
    assert_nil test_entry.detail("first_name")
    assert_nil test_entry.detail("FirST-NaME")
  end

  def test_record_entry_detail
    test_entry = Entry.new
    test_entry.load_template(["RegDate",
                              "first_Name",
                              "last_Name",
                              "Email_Address"])
    test_input = "Testname"
    test_entry.record("first_name", test_input)
    assert_equal test_input, test_entry.detail("first_name")
    test_entry.record("FIRst_nAme", test_input)
    assert_equal test_input, test_entry.detail("FirST-NaME")
  end

end