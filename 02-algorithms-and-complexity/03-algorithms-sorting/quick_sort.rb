def quick_sort(collection)
  return collection if collection.length <= 1

  pivot_index = collection.length - 1
  pivot_val = collection[pivot_index]
  lower = []
  higher = []

  for i in (0..(collection.length - 2))
    if collection[i] >= pivot_val
      higher << collection[i]
    else
      lower << collection[i]
    end
  end
  quick_sort(lower) + [pivot_val] + quick_sort(higher)
end

# c = []
# 50.times do
#   temp = rand(1000)
#   temp = temp * (-1) if rand(2) == 1
#   c.push(temp)
# end
#
# puts quick_sort(c)
