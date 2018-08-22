require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
    @item_count = 0.0
  end

  def []=(key, value)
    i = index(key, size)
    if @items[i].nil?
      @items[i] = Node.new(key, value)
      @item_count += 1
    elsif @items[i].key == key && @items[i].value == value
      return
    else
      next_i = next_open_index(i)
      if @items[i].key == key && @items[i].value != value && next_i == -1
        resize
        @items[next_i].value = value
        @item_count += 1
      elsif next_i == -1
        resize
        self[key] = value
      else
        @items[next_i] = Node.new(key, value)
        @items[next_i].value = value
        @item_count += 1
      end
    end
  end

  def [](key)
    i = index(key, size)
    while i < size
      if @items[i].key == key
        return @items[i].value
      else
        i += 1
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    i = index
    i += 1 while @items[i]
    i >= size ? -1 : i
  end

  # Simple method to return the number of items in the hash
  def size
    @items.size
  end

  # Resize the hash
  # def resize; end
  def resize
    temp = @items
    @items = Array.new(temp.length * 2)
    temp.each do |t|
      unless t.nil?
        i = index(t.key, @items.length)
        @items[i] = Node.new(t.key, t.value)
      end
    end
  end

  def print
    item_output = ['Array']
    temp = @items
    temp.each_with_index do |val, i|
      if val.nil?
        item_output.push('  [' + i.to_s + ']')
      else
        item_output.push('  [' + i.to_s + "]\t" + val.key + '] = "' + val.value + '"')
      end
    end
    item_output.each { |item| puts item }
    puts 'Load Factor: ' + (@item_count / size.to_f).to_s
  end
  #   [ THE FOLLOWING CODE ]
  #   star_wars_movies = OpenAddressing.new(6)
  #   star_wars_movies['Star Wars: The Phantom Menace'] = 'Number One'
  #   star_wars_movies['Star Wars: Attack of the Clones'] = 'Number Two'
  #   star_wars_movies['Star Wars: Revenge of the Sith'] = 'Number Three'
  #   star_wars_movies['Star Wars: A New Hope'] = 'Number Four'
  #   star_wars_movies['Star Wars: The Empire Strikes Back'] = 'Number Five'
  #   star_wars_movies['Star Wars: Return of the Jedi'] = 'Number Six'
  #   star_wars_movies.print
  #
  #   [ PRODUCES THE FOLLOWING PRINTOUT ]
  #   Array
  #     [0]
  #     [1]
  #     [2]	Star Wars: The Empire Strikes Back] = "Number Five"
  #     [3]	Star Wars: Attack of the Clones] = "Number Two"
  #     [4]	Star Wars: A New Hope] = "Number Four"
  #     [5]	Star Wars: Return of the Jedi] = "Number Six"
  #     [6]	Star Wars: The Phantom Menace] = "Number One"
  #     [7]
  #     [8]
  #     [9]
  #     [10]
  #     [11]	Star Wars: Revenge of the Sith] = "Number Three"
  #   Load Factor: 0.5
end
