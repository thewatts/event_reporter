require './test/test_helper'
require './lib/event_reporter/attendee'

class AttendeeTest < MiniTest::Test

  def setup
    @data = {
      :first_name    => "Jason",
      :last_name     => "Jones",
      :email_address => "jj@example.com",
      :homephone     => "123-555-1212",
      :street        => "4175 3rd Street North",
      :city          => "Saint Petersburg",
      :state         => "FL",
      :zipcode       => "3703",
      :regdate       => "11/12/08 13:23",
    }
    @attendee = EventReporter::Attendee.new(@data)
  end

  def test_it_initializes_with_data
    assert_kind_of EventReporter::Attendee, @attendee
    assert_equal @data[:first_name],    @attendee.first_name
    assert_equal @data[:last_name],     @attendee.last_name
    assert_equal @data[:email_address], @attendee.email_address
    assert_equal "1235551212",          @attendee.homephone
    assert_equal @data[:street],        @attendee.street
    assert_equal @data[:city],          @attendee.city
    assert_equal @data[:state],         @attendee.state
    assert_equal "03703",               @attendee.zipcode
    assert_equal @data[:regdate],       @attendee.regdate
  end

  def test_it_cleans_field_data
    attendee = EventReporter::Attendee.new(:first_name => nil)
    assert_equal "", attendee.first_name
  end

end
