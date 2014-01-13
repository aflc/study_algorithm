
def binary_search(l, tgt)
  return nil if l.length == 0
  start, fin = 0, l.length
  idx = (start + fin) / 2
  loop do
    return idx if l[idx] == tgt
    return nil if fin - start == 1
    if l[idx] < tgt
      start = idx
    else
      fin = idx
    end
    idx = (start + fin) / 2
  end
end


100.times do
  l = (1..100).map{ rand(100) }
  l.sort!
  l.uniq!
  idx = rand(l.length - 1)
  raise "false" unless binary_search(l, l[idx]) == idx
end