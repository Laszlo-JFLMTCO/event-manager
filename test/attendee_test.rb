require 'simplecov'
SimpleCov.start
require 'minitest/autorun'

class AttendeeTest < Minitest::Test

  def test_initializing
    assert Attendee.new
  end
end