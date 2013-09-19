require './test/test_helper'
require './lib/event_reporter/queue'

class QueueTest < MiniTest::Test

  def setup
    @queue = EventReporter::Queue.new
  end

  def test_it_initializes
    assert_kind_of EventReporter::Queue, @queue
    assert_equal 0, @queue.items.count
  end

  def test_default_count_is_zero
    assert_equal [], @queue.items
  end

  def test_it_retrieves_count
    items = [1,2,3,4,5]
    @queue.items = items
    assert_respond_to @queue, :count
    assert_equal 5, @queue.count
  end

  def test_it_resets_items
    items = [1,2,3,4,5]
    @queue.items = items
    @queue.clear
    assert_equal [], @queue.items 
  end

  # def test_it_processes_commands
  #   assert_respond_to @er, :process_command
  # end

  # def test_default_file
  #   assert_equal "event_attendees.csv", @er.default_file
  # end

  # def test_it_loads_filename
  #   filename = "sample.csv"
  #   @er.load(filename)
  #   assert_equal @er.filename, "./lib/#{filename}"
  # end

  # def test_it_loads_default_filename_if_no_filename_provided
  #   default_filename = "./lib/event_attendees.csv"
  #   @er.load
  #   assert_equal @er.filename, default_filename
  # end

  # def test_must_respond_to_queue
  #   assert_respond_to @er, :queue
  # end

  # def test_queue_default_count_is_zero
  #   assert_equal 0, @er.queue.count
  # end

  # def test_it_should_find_criteria_based_on_an_attribute
  #   @stubbed_er = StubbedEventReporter.new
  #   @stubbed_er.find("first_name", "sarah")
  #   assert_equal 2, @stubbed_er.queue.count
  # end

  # def test_it_can_clear_the_queue
  #   @stubbed_er.find("first_name", "sarah")
  #   @stubbed_er.reset_queue
  #   assert_equal 0, @stubbed_er.queue.count
  # end

  # def test_it_responds_to_print_queue
  #   assert_respond_to @er, :print_queue
  # end

  # def it_wont_print_queue_without_queue
  #   @er.reset_queue
  #   assert_silent @er.print_queue
  # end

  # def test_it_responds_to_print
  #   assert_respond_to @er, :print_data
  # end

  # def test_it_responds_to_setup_for_print
  #   assert_respond_to @er, :setup_for_print
  # end

  # def test_it_prints_queue_without_criteria
  #   skip
  #   assert_equal
  # end

  # def test_it_should_print_headers
  #   output = "LAST NAME  FIRST NAME  EMAIL  ZIPCODE  CITY  STATE  ADDRESS  PHONE  "
  #   assert_respond_to @er, :print_headers
  #   assert_output(output) { @er.print_headers }
  # end

  # def test_it_prints_queue_with_criteria
  #   @stubbed_er = StubbedEventReporter.new
  #   @stubbed_er.find("first_name", "sarah")
  #   assert_output("Size: 2") { print "Size: #{@stubbed_er.queue.count}"}
  # end

  # def test_it_should_setup_for_print
  #   @stubbed_er.find
  #   results =
  #     [
  #       {:first_name => "Adam"},
  #       {:first_name => "Frank"},
  #       {:first_name => "Jacob"},
  #       {:first_name => "Jason"},
  #       {:first_name => "Sarah"},
  #       {:first_name => "SArah"},
  #       {:first_name => "Tony"},
  #       {:first_name => "Zander"},
  #     ]
  #   criteria = "first_name"
  #   assert_equal results, @stubbed_er.setup_for_print(criteria)
  # end

  # def test_it_should_print_attendee
  #   #@stubbed_er.load
  #   @stubbed_er.find
  #   results = "Hankins         SArah       pinalevitsky@jumpstartlab.com          20009       Washington              DC     2022 15th Street NW                  4145205000"
  #   assert_respond_to @stubbed_er, :attendee_output
  #   assert_equal results, @stubbed_er.attendee_output(@stubbed_er.queue[0])
  # end

end
