require './test/test_helper'
require './lib/event_reporter/attendee'
require './lib/event_reporter/printer'

class PrinterTest < MiniTest::Test
  
  def setup
    @printer = EventReporter::Printer.new
    @name_data = [
      {:first_name => "Jonah"},
      {:first_name => "Sarah"},
      {:first_name => "Alex"},
      {:first_name => "Robert"},
      {:first_name => "Bobby"},
    ]
    @attendee_data = [
      {
        :first_name    => "Jason",
        :last_name     => "Jones",
        :email_address => "j@example.com",
        :homephone     => "1235551212",
        :street        => "123 cheese st.",
        :city          => "Denver",
        :state         => "CO",
        :zipcode       => "12345",
      },
      {
        :first_name    => "Sarah",
        :last_name     => "Smith",
        :email_address => "s@example.com",
        :homephone     => "551212",
        :street        => "123 cheese st. plus stuff",
        :city          => "Omaha",
        :state         => "NE",
        :zipcode       => "345",
      },
      {
        :first_name    => "Bartholomeau",
        :last_name     => "GregariousLastName",
        :email_address => "basdf@example.com",
        :homephone     => "1235551212",
        :street        => "PO BOX 123",
        :city          => "Anchorage",
        :state         => "AK",
        :zipcode       => "12345",
      },
    ]
    @attendees = @attendee_data.collect { |d| EventReporter::Attendee.new(d) }
  end

  def test_it_initializes
    assert_kind_of EventReporter::Printer, @printer
  end

  def test_it_has_no_errors_on_initialize
    assert_equal 0, @printer.errors.count
  end

  def test_it_receives_headers
    headers = %w(last\n name first\ name email zipcode city state address phone)
    @printer.set_headers(headers)
    assert_equal @printer.headers, headers
  end

  def test_it_receives_data
    data = %w(Jim Suzy Jack)
    @printer.set_data(data)
    assert_equal @printer.data, data
  end

  def test_it_formats_data
    intended_result = ["Alex", "Bobby", "Jonah", "Robert", "Sarah"]
    printer_data = @name_data.collect{ |d| EventReporter::Attendee.new(d) }
    criteria = "first_name"
    @printer.set_data(printer_data)
    @printer.format_by(criteria)
    
    results = @printer.data.collect { |d| d.first_name }
    assert_equal intended_result, results
  end

  def test_it_prints_headers
    skip   
  end

  def test_it_returns_an_array_of_correct_column_sizes
    #desired_sizes = [12,18,17,10,25,9,5,7]
    desired_sizes = [12,18,17,10,25,9,5,10]
    @printer.set_data(@attendees)
    @printer.format_columns 
    assert_equal desired_sizes, @printer.column_sizes
  end

  def test_it_returns_printed_headers 

  end

end
