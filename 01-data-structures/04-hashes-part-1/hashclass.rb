class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    index = index(key,@items.length)
    if @items[index] == nil
      @items[index] = HashItem.new(key, value)
    elsif @items[index].key != key
      self.resize
      self[key] = value
    elsif @items[index].key == key && @items[index].value != value
      self.resize
      @items[index(key, @items.length)].value = value
    end
  end


  def [](key)
    index = index(key,@items.length)
    if @items[index] != nil && @items[index].key == key
      @items[index].value
    end
  end

  def resize
    temp = @items
    @items = Array.new(temp.length * 2)
    temp.each do |x|
      unless x == nil
        key = x.key
        value = x.value
        index = index(key, @items.length)
        if @items[index] == nil
          self[key] = value
        elsif @items[index].key != key
          self.resize
          self[key] = value
        elsif @items[index].key === key && @items[index].value != value
          self.resize
          @items[index].value = value
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

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end
end
