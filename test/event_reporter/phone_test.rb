require './test/test_helper'
require './lib/event_reporter/phone'

class PhoneTest < MiniTest::Test

  def setup
    @phone = EventReporter::Phone.new
  end

  def test_it_cleans_phone_numbers
    eleven_start_1 = "12345678901"
    eleven_start_not_1 = "23456789012"
    too_long = "1111112345678901"
    too_short = "123"
    ten_digit = "1231231234"
    clean_eleven_start_1 = @phone.clean(eleven_start_1)
    clean_eleven_start_not_1 = @phone.clean(eleven_start_not_1)
    clean_too_long = @phone.clean(too_long)
    clean_too_short = @phone.clean(too_short)
    clean_ten_digit = @phone.clean(ten_digit)
    
    assert_equal "2345678901", clean_eleven_start_1
    assert_equal "0000000000", clean_eleven_start_not_1
    assert_equal "0000000000", clean_too_long
    assert_equal "0000000000", clean_too_short
    assert_equal ten_digit, clean_ten_digit
  end

end
