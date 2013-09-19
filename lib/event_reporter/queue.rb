module EventReporter

  class Queue
    attr_accessor :items

    def initialize
      @items = []
    end

    def count
      @items.count
    end

    def clear
      @items = []
    end
  end

end
