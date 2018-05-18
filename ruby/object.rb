require 'uri'
require 'net/http'
require 'json'

# Object #yield_self
"https://api.github.com/repos/rails/rails"
  .yield_self { |it| URI.parse(it) }
  .yield_self { |it| Net::HTTP.get(it) }
  .yield_self { |it| JSON.parse(it) }
  .yield_self { |it| it.fetch("stargazers_count") }
  .yield_self { |it| "Rails has #{it} stargazers" }
  .yield_self { |it| puts it }



# Object #method
url = 'https://ruby-doc.org/core-2.5.0/Object.html#method-i-method'
m = URI.method(:parse)
puts m.call(url).host