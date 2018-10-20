# set to true and steps will be printed in the console, showing the distance
# between the current city and each of the remaining cities.
PRINT_STEPS = true

class City
  attr_accessor :name
  attr_accessor :x
  attr_accessor :y

  def initialize(name, x, y)
    @name = name
    @x = x
    @y = y
  end
end

# Creates a greedy path for the salesman, always travelling to the closest city
# The starting city is the first city in the cities array
def greedy_salesman (cities)
  path = []
  not_visited = cities
  path.push(not_visited.shift)
  loop do
    current = path.last
    # for testing, only prints if PRINT_STEPS is set to true at the top of the file
    puts "current: " + current.name + " (" + current.x.round(2).to_s + "," + current.y.round(2).to_s + ")" if PRINT_STEPS
    next_city = nearest_possible_neighbor(current,not_visited)
    path.push(not_visited.delete(next_city))
  break if not_visited.empty?
  end
  path
end

def nearest_possible_neighbor(current_city, not_visited)
  neighbor_cities = not_visited
  closest_neighbor = not_visited.first
  i = 1
  shortest_distance = distance(current_city,closest_neighbor)
  # for testing, only prints if PRINT_STEPS is set to true at the top of the file
  puts "\tdist: " + shortest_distance.round(2).to_s + "\t" + closest_neighbor.name + " (" + closest_neighbor.x.round(2).to_s + "," + closest_neighbor.y.round(2).to_s + ")"  if PRINT_STEPS
  (not_visited.length - 1).times do
    next_city = not_visited[i]
    dist = distance(current_city,next_city)
    if dist < shortest_distance
      closest_neighbor = next_city
      shortest_distance = dist
    end
    # for testing, only prints if PRINT_STEPS is set to true at the top of the file
    puts "\tdist: " + dist.round(2).to_s + "\t" + next_city.name + " (" + next_city.x.round(2).to_s + "," + next_city.y.round(2).to_s + ")"  if PRINT_STEPS

    i += 1
  end
  closest_neighbor
end

def distance(city_1,city_2)
  Math.hypot((city_2.x - city_1.x).abs, (city_2.y - city_1.y).abs)
end

all_cities = []
all_cities << City.new("Los Angeles",34.052235,-118.243683)
all_cities << City.new("Seattle",47.608013,-122.335167)
all_cities << City.new("Atlanta",33.753746,-84.386330)
all_cities << City.new("San Francisco",37.733795,-122.446747)
all_cities << City.new("Houston",29.759438,-95.369957)
all_cities << City.new("Washington D.C.",38.9072,-77.0369)
all_cities << City.new("Dallas",32.897480,-97.040443)
all_cities << City.new("New York",40.730610,-73.935242)
all_cities << City.new("Portland",45.523064,-122.676483)

greedy_salesman(all_cities).each{ |city| puts city.name }
