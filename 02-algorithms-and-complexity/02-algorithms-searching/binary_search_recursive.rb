def binary_search_recursive(collection, target, low=0, high=collection.length-1)
  return nil if target < collection.first
  return nil if target > collection.last

  while low <= high
    mid = (low + high) / 2
    if collection[mid] == target
      return collection[mid]
    elsif collection[mid] < target
      low = mid + 1
    else # collection[mid] > target
      high = mid - 1
    end
    binary_search_recursive(collection[low..high],target)
  end
  return nil
end
