# This method takes n arrays as input and combine them in sorted ascending  order
 def space_optimizations(*arrays)
   arrays.map{|a| a}.flatten.sort
 end
