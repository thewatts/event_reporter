module EventReporter

  class Attendee

    attr_accessor :first_name, :last_name, :email_address, :homephone,
                  :street, :city, :state, :zipcode, :regdate
          

    def initialize(data)
      @first_name    = data[:first_name]
      @last_name     = data[:last_name]
      @email_address = data[:email_address]
      @homephone     = data[:homephone]
      @street        = data[:street]
      @city          = data[:city]
      @state         = data[:state]
      @zipcode       = data[:zipcode]
      @regdate       = data[:regdate]
    end

  end

end
