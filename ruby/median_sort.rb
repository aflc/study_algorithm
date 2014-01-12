# 中央値ソート

def median_sort!(l, start=0, fin=nil)
  fin = l.length if fin.nil?
  return if fin - start == 1
  select_median = ->() {
    select_ = ->(s, e) {
      return s if s == e
      tgt = l[e - 1]
      slot = s
      (s...e).each do |i|
        if l[i] < tgt
          l[slot], l[i] = l[i], l[slot]
          slot += 1
        end
      end
      l[e - 1], l[slot] = l[slot], l[e - 1]
      slot
    }
    mi = (fin + start) / 2
    rs, re = start, fin
    loop do
      guess = select_.call(rs, re)
      return guess if guess == mi
      guess < mi ? rs = guess + 1 : re = guess
    end
  }
  med = select_median.call()
  median_sort!(l, 0, med)
  median_sort!(l, med, fin)
  l
end

100.times do
  l = (1..10).map{ rand(100) }
  col = Array.new(l)
  raise "failed" unless median_sort!(l) == col.sort!()
  l2 = (1..11).map{ rand(100) }
  col2 = Array.new(l2)
  raise "failed" unless median_sort!(l2) == col2.sort!()
end