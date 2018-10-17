require_relative 'quick_sort'
def bucket_sort(collection)
 min = collection.min
 max = collection.max
 num_buckets = Math.sqrt(collection.length).round
 d = ((max - min) / num_buckets).floor + 1
 buckets = Array.new(num_buckets) { [] }

 collection.each do |val|
   i = ((val - min) / d).floor
   buckets[i].push(val)
 end

 (0..(buckets.length-1)).each { |i|
   buckets[i] = quick_sort(buckets[i])
 }

 sorted_collection = []
 buckets.each do |bucket|
   bucket.each do |item|
     sorted_collection.push(item)
   end
 end
 return sorted_collection
end

# c = []
# 50.times do
#   temp = rand(1000)
#   temp = temp * (-1) if rand(2) == 1
#   c.push(temp)
# end
#
# puts bucket_sort(c)
