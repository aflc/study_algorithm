# 再帰でなくスタック方式で書く

def quick_sort!(l)
  return l if l.length <= 1
  stack = [[0, l.length]]
  until stack.length == 0
    rs, re = stack.pop
    th = l[re - 1]
    slot = rs
    (rs...re).each do |i|
      if l[i] <= th
        l[slot], l[i] = l[i], l[slot]
        slot += 1
      end
    end
    slot -= 1
    stack.push([rs, slot]) if slot - rs > 1
    stack.push([slot, re]) if re - slot > 1
  end
  l
end

p quick_sort!((1..50).map{ rand(100) })