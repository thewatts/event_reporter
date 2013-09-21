require './test/test_helper'
require './lib/event_reporter/zipcode'

class ZipCodeTest < MiniTest::Test

  def setup
    @zip = EventReporter::ZipCode.new
  end

  def test_it_cleans_zipcodes
    legit_code        = "48823"
    short_code        = "2323"
    broken_code       = "ab3"
    long_code         = "4882323"
    clean_legit_code  = @zip.clean(legit_code)
    clean_short_code  = @zip.clean(short_code)
    clean_broken_code = @zip.clean(broken_code)
    clean_long_code   = @zip.clean(long_code)
    
    assert_equal "48823", clean_legit_code
    assert_equal "02323", clean_short_code
    assert_equal "00000", clean_broken_code
    assert_equal "00000", clean_long_code
  end

end
