require './lib/event_reporter/phone'
require './lib/event_reporter/zipcode'

module EventReporter

  class Attendee

    attr_accessor :first_name, :last_name, :email_address, :homephone,
                  :street, :city, :state, :zipcode, :regdate, 
                  :formattable_columns

    def initialize(data)
      @first_name    = clean_field(data[:first_name])
      @last_name     = clean_field(data[:last_name])
      @email_address = clean_field(data[:email_address])
      @homephone     = clean_phone(data[:homephone])
      @street        = clean_field(data[:street])
      @city          = clean_field(data[:city])
      @state         = clean_field(data[:state])
      @zipcode       = clean_zip(data[:zipcode])
      @regdate       = clean_field(data[:regdate])
    end

    def clean_field(field = nil)
      field.to_s  
    end

    def clean_phone(number = nil)
      EventReporter::Phone.new.clean(number.to_s)
    end

    def clean_zip(zip = nil)
      EventReporter::ZipCode.new.clean(zip.to_s)
    end

    def formattable_attributes
      %w( 
         first_name last_name email_address 
         homephone street city state zipcode 
        )
    end

  end

end
