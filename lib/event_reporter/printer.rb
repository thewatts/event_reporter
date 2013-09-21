module EventReporter

  class Printer

    attr_reader :headers, :data, :errors, :column_sizes

    def initialize
      @errors = []
    end

    def set_headers(headers = [])
      @headers = headers 
    end

    def set_data(data = [])
      @data = data
    end


    def format_columns
      returned_values = @data.first.formattable_attributes.collect do |att|
        max = @data.max_by { |attendee| attendee.send(att).length }
        if max.send(att).length > att.length
          max.send(att).length
        else
          att.length
        end
      end
      @column_sizes = returned_values
    end

    def format_by(criteria)
      formatted_criteria = criteria.to_s.downcase
      data.sort_by! { |item| item.send(formatted_criteria) }
    end

  end

end

#def print_queue(criteria = nil)
#unless @queue.items.empty?
#  print @queue.items if criteria.nil?
#  eval 'setup_for_print(criteria); print_data @queue'
#end
#end
