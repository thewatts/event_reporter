require './lib/event_reporter/loader'
require './lib/event_reporter/parser'
#require './lib/event_reporter/printer'
#require './lib/event_reporter/writer'
require './lib/event_reporter/queue'


module EventReporter
  class Reporter

    attr_reader :filename, :queue

    def initialize
      @queue  = EventReporter::Queue.new
      @loader = EventReporter::Loader.new
      @loader.default_filename = default_filename
    end

    def run
      puts "Welcome to Event Reporter"

      input = ""
      while input != "quit"
        puts ""
        printf "enter command: "
        input   = gets.chomp
        parts   = input.split(" ")
        command = parts[0]
        process_command(command, parts)
      end
    end

    def process_command(command, parts)
      case command
       when "help" then help(parts)
       when "cue"  then cue(part)
       when "find" then find(parts)
       when "load" then load(parts)
       when "quit" then quit
      end
    end

    def default_filename
      "event_attendees.csv"   
    end

    def filename
      @loader.filename
    end

    def load(filename = nil)
      @loaded_data = @loader.load(filename)
    end

    def data
      @loaded_data
    end

    def reset_queue
      @queue.clear
    end


    def find(attribute = nil, criteria = nil)
      @parser ||= EventReporter::Parser.new
      reset_queue

      if @loaded_data
        if attribute && criteria
          @queue.items = @parser.find_all(data, attribute, criteria)
        else
          @queue.items = @parser.collect(data)
        end
      end
    end

    def print_queue(criteria = nil)
      unless @queue.items.empty?
        print @queue.items if criteria.nil?
        eval 'setup_for_print(criteria); print_data @queue'
      end
    end

    def print_data
      print_headers
      puts ""
      print "testing"
    end

    def print_headers
      headers.each { |h| print "#{h.upcase.gsub("_", " ")}  " }
    end

    def print_attendees
      @queue.items.each { |attendee| print attendee_output(attendee) }
    end

    def attendee_output(attendee)
      "Hankins         SArah       pinalevitsky@jumpstartlab.com          20009       Washington              DC     2022 15th Street NW                  4145205000"
    end

    def headers
      %w(last_name first_name email zipcode city state address phone)
    end

    def setup_for_print(criteria)
      criteria.to_sym
      @queue.items.sort_by { |item| item[criteria] }
    end

  end
end
