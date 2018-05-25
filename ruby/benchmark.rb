require 'benchmark'

n = 50000
Benchmark.bm(5) do |x|
  x.report('for  ') { for i in 1..n; a = "1"; end }
  x.report('times') { n.times do   ; a = "1"; end }
  x.report('upto ') { 1.upto(n) do ; a = "1"; end }
end
puts
Benchmark.bmbm do |x|
  x.report('for  ') { for i in 1..n; a = "1"; end }
  x.report('times') { n.times do   ; a = "1"; end }
  x.report('upto ') { 1.upto(n) do ; a = "1"; end }
end
