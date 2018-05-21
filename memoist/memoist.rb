require 'memoist'

class Person
  extend Memoist
  def taxes_due(income)
    puts "executed at #{Time.now} for income = #{income}"
    income * 0.40
  end
  memoize :taxes_due
end

Person.new.tap do |p|
  puts p.taxes_due(100)            # "executed at ... for income = 100" => 40
  # This will only be calculated once per value of income.
  puts p.taxes_due(100)            # => 40
  puts p.taxes_due(10)             # "executed at ... for income = 10" => 4

  # Every memoized function (which initially was not accepting any arguments)
  # has a (reload) argument you can pass in to bypass and reset the memoization
  puts p.taxes_due(100, true)      # "executed at ... for income = 100" => 40
end

# memoize for subclass
class Clock
  extend Memoist
  def now
    puts "Clock::now executed"
     "The time now is #{Time.now.hour} o'clock and #{Time.now.min} minutes"
  end
  memoize :now
end

class AccurateClock < Clock
  extend Memoist
  def now
    "#{super} and #{Time.now.sec} seconds"
  end
  memoize :now, :identifier => :accurate_clock
end

AccurateClock.new.tap do |c|
  puts c.now
  sleep 2
  puts c.now
end
