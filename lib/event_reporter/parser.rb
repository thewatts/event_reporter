module EventReporter
  
  class Parser

    attr_reader :data
    
    def initialize

    end

    def find_all(data, attribute, criteria)
      @data = data
      valid_attribute = validate_attribute(attribute)
      valid_criteria  = validate_criteria(criteria)

      data.find_all { |row| row[valid_attribute].downcase == valid_criteria if row[valid_attribute] }
    end

    def collect(data)
      data.collect { |row| row } 
    end

    def validate_attribute(attribute)
      attribute.downcase.to_sym
    end

    def validate_criteria(criteria)
      criteria.downcase
    end

  end

end
