require 'uri'

url = 'https://ruby-doc.org/core-2.5.0/Object.html#method-i-method'
m = URI.method(:parse)
puts m.call(url).host