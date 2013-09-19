require './test/test_helper'
require './lib/event_reporter/parser'

class ParserTest < MiniTest::Test
  
  def setup
    @parser = EventReporter::Parser.new
  end

  def test_it_should_initialize
    assert_kind_of EventReporter::Parser, @parser
  end

  def test_it_should_find_all_correctly
    attribute = "first_name"
    criteria  = "Sarah"
    data = 
      [
        {:first_name => "Frank"},
        {:first_name => "Adam"},
        {:first_name => "Jacob"},
        {:first_name => "Tony"},
        {:first_name => "Sarah"},
        {:first_name => "Zander"},
        {:first_name => "Jason"},
        {:first_name => "SArah"},
      ]

    results = @parser.find_all(data, attribute, criteria)
    assert_equal 2, results.count
  end

end
