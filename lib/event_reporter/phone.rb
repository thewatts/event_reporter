module EventReporter
  
  class Phone
    
    def clean(number)
      if number
        number = number.scan(/[0-9]/).join
        if number.length == 11 && number.start_with?("1")
          number.slice!(0)
        end
        if number.length != 10
          number = "0000000000"
        end

        number
      end  
    end

  end

end
