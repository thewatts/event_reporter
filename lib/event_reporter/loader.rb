require 'csv'

module EventReporter

  class Loader

    attr_accessor :filename, :default_filename

    def initialize
      @default_filename = "event_attendees.csv"
      @filename         = @default_filename
    end

    def default_directory
      "./lib/"
    end

    def filename_path
      "#{default_directory}#{@filename}"
    end

    def load(filename = nil)
      @filename = filename || @default_filename
      CSV.read filename_path, headers: true, header_converters: :symbol if File.exists?(filename_path)
    end

  end


end
