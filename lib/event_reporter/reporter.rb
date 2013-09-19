require './lib/event_reporter/data_store'
require './lib/event_reporter/queue'

module EventReporter
  class Reporter

    attr_reader :filename, :queue

    def initialize
      @queue = []
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

    def load(filename = nil)
      unless filename.nil?
        @filename = "./lib/#{filename}"
      else
        @filename = "./lib/#{default_file}"
      end
      load_file_data
    end

    def reset_queue
      @queue = []
    end

    def default_file
      "event_attendees.csv"
    end

    def load_file_data
      @loaded_data = CSV.read @filename, headers: true,
                     header_converters: :symbol if File.exists?(@filename)
    end

    def data
      @loaded_data
    end

    def find(attribute = nil, criteria = nil)
      reset_queue
      if attribute && criteria
        valid_attribute = attribute.downcase.to_sym
        valid_criteria  = criteria.downcase
        @queue = data.find_all { |row| row[valid_attribute].downcase == valid_criteria }
      else
        @queue = data.collect { |row| row }
      end
    end

    def print_queue(criteria = nil)
      unless @queue.empty?
        print @queue if criteria.nil?
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
      @queue.each { |attendee| print attendee_output(attendee) }
    end

    def attendee_output(attendee)
      "Hankins         SArah       pinalevitsky@jumpstartlab.com          20009       Washington              DC     2022 15th Street NW                  4145205000"
    end

    def headers
      %w(last_name first_name email zipcode city state address phone)
    end

    def setup_for_print(criteria)
      criteria.to_sym
      @queue.sort_by { |item| item[criteria] }
    end

  end
end
