def binary_search_iterative(collection, target)
  return nil if target < collection.first
  return nil if target > collection.last

  low = 0
  high = collection.length - 1

  while low <= high
    mid = (low + high) / 2
    if collection[mid] == target
      return collection[mid]
    elsif collection[mid] < target
      low = mid + 1
    else # collection[mid] > target
      high = mid - 1
    end
  end
  return nil
end
