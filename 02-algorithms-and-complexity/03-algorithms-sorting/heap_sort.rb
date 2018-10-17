def heap_sort(collection)
  # heapify
  (1..collection.length - 1).each do |i|
    child = i
    while child > 0
      parent = (child - 1) / 2
      if collection[parent] < collection[child]
        temp = collection[parent]
        collection[parent] = collection[child]
        collection[child] = temp
        child = parent
      else
        break
      end
    end
  end
  # sort
  i = collection.length - 1
  while i > 0
    temp = collection[0]
    collection[0] = collection[i]
    collection[i] = temp
    i -= 1
    parent = 0
    while parent * 2 < i
      child = parent * 2 + 1
      if child < i && collection[child] < collection[child + 1]
        child += 1
      end
      if collection[parent] < collection[child]
        temp = collection[child]
        collection[child] = collection[parent]
        collection[parent] = temp
        parent = child
      else
        break
      end
    end
  end
  collection
end

# c = []
# 50.times do
#   temp = rand(1000)
#   temp = temp * (-1) if rand(2) == 1
#   c.push(temp)
# end
#
# puts heap_sort(c)
