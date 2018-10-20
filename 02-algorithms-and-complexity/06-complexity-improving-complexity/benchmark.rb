require 'benchmark'
require_relative 'improving_complexity_version_one'
require_relative 'improving_complexity_version_two'
require_relative 'improving_complexity_version_three'

z = []
100.times do
  y = []
  100.times do
    y << rand(10000000)
  end
  z << y
end
a = z
b = z
c = z
d = z

# This method takes n arrays as input and combine them in sorted ascending  order
 def poorly_written_ruby(*arrays)
   combined_array = arrays.flatten

   sorted_array = [combined_array.delete_at(combined_array.length-1)]

   for val in combined_array
     i = 0
     while i < sorted_array.length
       if val <= sorted_array[i]
         sorted_array.insert(i, val)
         break
       elsif i == sorted_array.length - 1
         sorted_array << val
         break
       end
       i+=1
     end
   end

   # Return the sorted array
   sorted_array
 end

Benchmark.bm do |x|
  x.report("original code")   {
    poorly_written_ruby(a)
  }

  x.report("code optimization")   {
    code_optimizations(b)
  }

  x.report("time optimization")   {
    time_optimizations(c)
  }

  x.report("space optimization")   {
    space_optimizations(d)
  }
end

#                     user       system     total     real
# original code       1.540000   0.000000   1.540000  (  1.559525)
# code optimization   1.310000   0.010000   1.320000  (  1.320237)
# time optimization   0.270000   0.130000   0.400000  (  0.395520)
# space optimization  0.000000   0.000000   0.000000  (  0.002098)
