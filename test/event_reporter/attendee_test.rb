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
      :zipcode       => "33703",
      :regdate       => "11/12/08 13:23",
    }
    @attendee = EventReporter::Attendee.new(@data)
  end

  def test_it_initializes_with_data
    assert_kind_of EventReporter::Attendee, @attendee
    assert_equal @data[:first_name],    @attendee.first_name
    assert_equal @data[:last_name],     @attendee.last_name
    assert_equal @data[:email_address], @attendee.email_address
    assert_equal @data[:homephone],     @attendee.homephone
    assert_equal @data[:street],        @attendee.street
    assert_equal @data[:city],          @attendee.city
    assert_equal @data[:state],         @attendee.state
    assert_equal @data[:zipcode],       @attendee.zipcode
    assert_equal @data[:regdate],       @attendee.regdate
  end

end
