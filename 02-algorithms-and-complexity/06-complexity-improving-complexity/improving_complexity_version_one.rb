# This method takes n arrays as input and combine them in sorted ascending  order
def code_optimizations(*arrays)
  # The previous code iterated through each array and added the elements to
  # combined_array. arrays.flatten is a recursive function that flattens the
  # arrays into a single one-dimensional array. I did some benchmark testing and
  # the times seemed nearly identical, neither consistently out-performing the
  # other
  combined_array = arrays.flatten

  # simpler to use pop here, same functionality
  sorted_array = [combined_array.pop]

  for val in combined_array
    i = 0
    # created this variable rather than grabbing the length of the array twice
    sorted_len = sorted_array.length
    while i < sorted_len
      if val <= sorted_array[i]
        sorted_array.insert(i, val)
        break
      elsif i == sorted_len - 1
        sorted_array << val
        break
      end
      i+=1
    end
  end

  # Return the sorted array
  sorted_array
end
