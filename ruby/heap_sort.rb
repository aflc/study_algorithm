# ヒープソート

def heapify(l, start, fin)
  # 逆順にheapを作る
  return l if fin - start == 1
  swap_parent = ->(x) do
    pi = x + (fin - x + 1) / 2
    loop do
      return if pi == fin || l[pi] >= l[x]
      l[pi], l[x] = l[x], l[pi]
      x = pi
      pi = x + (fin - x + 1) / 2
    end
  end
  (fin - 2).downto(0).each do |i|
    swap_parent.call(i)
  end
end

def heap_sort! l
  return l if l.length == 1
  l.length.downto(2).each do |i|
    heapify(l, 0, i)
  end
  l
end

p heap_sort!((1..20).map{ rand(100) })