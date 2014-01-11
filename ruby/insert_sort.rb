# 挿入ソート

def insert_sort! l
  (1...l.length).each do |i|
    i.downto(1).each do |j|
      if l[j] < l[j - 1]
        l[j - 1], l[j] = l[j], l[j - 1]
      else
        break
      end
    end
  end
  l
end

p insert_sort!((1..10).map{ rand(100) })