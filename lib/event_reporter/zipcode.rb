module EventReporter
  class ZipCode
    
    def clean(zipcode)
      unless zipcode.nil?
        zipcode = "00000" if (zipcode =~ %r{[0-9]}) != 0
        zipcode = "00000" if zipcode.length > 5
        zipcode = zipcode.rjust(5, "0") if zipcode.length < 5
      else
        zipcode = "00000"
      end
      zipcode
    end

  end
end
