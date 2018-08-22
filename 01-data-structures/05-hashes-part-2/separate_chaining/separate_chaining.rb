require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
    @item_count = 0.0
  end

  # DEF INSERT(key, value)
  #     COMPUTE the hash code for key, ASSIGN to index
  #     GET array[index], ASSIGN to oldHead
  #     SET array[index] to a link that contains key and value
  #     IF oldHead exists THEN
  #         SET oldHead as the second link in the chain
  #     END IF
  # END DEF
  def []=(key, value)
    i = index(key, size)
    @items[i] = LinkedList.new if @items[i].nil?
    @items[i].add_to_front(Node.new(key, value))
    @item_count += 1
    resize if load_factor >= @max_load_factor
  end

  def [](key)
    i = index(key, size)
    if @items[i]
      c = @items[i].head
      until c.nil?
        if c.key == key
          return c.value
        else
          c = c.next
        end
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor
    @item_count / size.to_f
  end

  # Simple method to return the number of items in the hash
  def size
    @items.size
  end

  # Resize the hash
  def resize
    temp = @items
    @items = Array.new(temp.length * 2)
    temp.each do |i|
      next unless i
      c = i.head
      next unless c
      i = index(c.key, size)
      @items[i] = LinkedList.new if @items[i].nil?
      @items[i].add_to_front(Node.new(c.key, c.value))
      resize if load_factor >= @max_load_factor
      c = c.next
    end
  end

  def print
    item_output = ['Array']
    temp = @items
    temp.each_with_index do |val, i|
      item_output.push('  [' + i.to_s + ']') if val.nil?
      next unless val
      item_output.push('  [' + i.to_s + "]\tLinked List")
      c = val.head
      until c.nil?
        item_output.push("\t  [" + c.key + '] = "' + c.value + '"')
        c = c.next
      end
    end
    item_output.each { |item| puts item }
    puts 'Load Factor: ' + load_factor.to_s
  end
  #   [ THE FOLLOWING CODE ]
  #   star_wars_movies = SeparateChaining.new(6)
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
  #   [0]
  #   [1]
  #   [2]   Linked List
  #          [Star Wars: The Empire Strikes Back] = "Number Five"
  #   [3]   Linked List
  #          [Star Wars: Return of the Jedi] = "Number Six"
  #          [Star Wars: Attack of the Clones] = "Number Two"
  #   [4]   Linked List
  #          [Star Wars: A New Hope] = "Number Four"
  #   [5]
  #   [6]   Linked List
  #          [Star Wars: The Phantom Menace] = "Number One"
  #   [7]
  #   [8]
  #   [9]
  #   [10]
  #   [11]  Linked List
  #          [Star Wars: Revenge of the Sith] = "Number Three"
end
