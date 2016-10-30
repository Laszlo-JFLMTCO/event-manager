require './lib/filters'

class FiltersTest < Minitest::Test
  include Filters

  def test_rubynizer
    assert_equal "regdate", rubynizer("RegDate")
    assert_equal "email_address", rubynizer("Email-Address")
  end

  def test_zip_fixer
    assert_equal "00000", zip_fixer(nil)
    assert_equal "00000", zip_fixer("")
    assert_equal "00001", zip_fixer("1")
    assert_equal "00012", zip_fixer("12")
    assert_equal "00123", zip_fixer("123")
    assert_equal "01234", zip_fixer("1234")
    assert_equal "12345", zip_fixer("12345")
    assert_equal "12345", zip_fixer("1234567")
    assert_equal "12345", zip_fixer("12345-6789")
  end    

end