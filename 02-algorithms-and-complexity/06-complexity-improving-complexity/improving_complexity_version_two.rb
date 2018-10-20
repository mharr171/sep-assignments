# This method takes n arrays as input and combine them in sorted ascending  order
def time_optimizations(*arrays)
  # switched to a standard merge sort, as we do not know the number of items
  # in the arrays we will be handling.
  sorted_array = merge_sort(arrays.flatten)
end

# copied from checkpoint: https://www.bloc.io/users/matthew-harris/checkpoints/1859?section_id=205
def merge_sort(collection)
  if collection.length <= 1
    collection
  else
    mid = (collection.length / 2).floor
    left = merge_sort(collection[0..mid - 1])
    right = merge_sort(collection[mid..collection.length])
    merge(left, right)
  end
end

# copied from checkpoint: https://www.bloc.io/users/matthew-harris/checkpoints/1859?section_id=205
def merge(left, right)
  if left.empty?
    right
  elsif right.empty?
    left
  elsif left.first < right.first
    [left.first] + merge(left[1..left.length], right)
  else
    [right.first] + merge(left, right[1..right.length])
  end
end
