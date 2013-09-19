module EventReporter

  attr_accessor :values

  class Queue
    @values = []
  end

  def count
    @values.count
  end

  def reset
    @values = []
  end

end
