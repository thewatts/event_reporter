require './test/test_helper'
require './lib/event_reporter/loader'

class LoaderTest < MiniTest::Test

  def setup
    @loader = EventReporter::Loader.new
    @loader.default_filename = "event_attendees.csv"
  end

  def test_it_should_load_filename_if_provided
    filename = "sample.csv"
    @loader = EventReporter::Loader.new
    @loader.load(filename)
    assert_equal @loader.filename, filename
  end

  def test_it_loads_default_filename_if_no_filename_provided
    assert_equal @loader.filename, @loader.default_filename
  end

  def test_it_should_have_a_default_directory
    assert_equal "./lib/", @loader.default_directory
  end

  def test_it_should_load_data_from_file
    results = @loader.load
    assert_equal 5175, results.count
  end

end
