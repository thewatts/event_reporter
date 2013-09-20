# SPLIT
stuff = %w(print my stuff)
command, stuff = stuff.split(" ", 2) # splits on a space, *into 2 chunks*

# RAKEFILE run do

```
desc "Run the Event Reporter with the default data"
task :run do
  require './lib/event_reporter' #etc
  EventReporter.run
end
```

# Say (word), with :silence
```
attr_accessor :silence

def say(word)
  puts word unless silence
end

# or
def say(word)
  Kernel.puts(word)
end
```

```
begin
  @contents = CSV ...
rescue #everything
  puts "Error loading file."
  @contents = []
end

# TERNARY
use it when obvuscating (don't use it with multiple methods... too much info)
ex:
```
  command_valid?(command_parts[0]) ? run_valid_command(command_parts) : other_command(command_parts[0])
```

# HUB
- $ brew install hub

# def < (object) -- or spacship <=>
```
def < (object)
  # 1  go later
  # -1 go before
  # 0
end

def <=> (object)
  # make sure to 'include Comparable'
  # all three [<, >, ==] in one
end
```

# clean methods on my attendee.rb initialize
```
@id = clean_id(input[:id])
--
@id.to_s.strip
```

# AttendeeDataCleaner (?)

# Attendee.new.instance_variables
# a = Attendee.new
# a.instance_variable_get("@variable")
# a.instance_variable_set("@variable")

# GUARD CLAUSE --- if this doesn't do something, EJECT

before:
```
def find(attribute = nil, criteria = nil)
  @parser ||= EventReporter::Parser.new
  reset_queue

  if @loaded_data
    if attribute && criteria
      @queue.items = @parser.find_all(data, attribute, criteria)
    else
      @queue.items = @parser.collect(data)
    end
  end
end
```

after:
```
def find(attribute = nil, criteria = nil)
  return unless @loaded_data

  @parser ||= EventReporter::Parser.new
  reset_queue

  if attribute && criteria
    @queue.items = @parser.find_all(data, attribute, criteria)
  else
    @queue.items = @parser.collect(data)
  end
end
```

# SPLAT
```
data = [:food, "pizza", :color, "blue"]
Hash[data] # => broken
Hash[*data] # => {:food => "pizza", :color => "blue"}
```

# COMMAND COORDINATOR
