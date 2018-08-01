class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack[@stack.length] = item
    self.top = item
  end

  def pop
    if @stack.empty?
      return nil
    else
      popped = @stack.last
      @stack.delete_at(@stack.length-1)
      @stack.empty? ? self.top = nil : self.top = @stack[@stack.length-1] 
      return popped
    end
  end

  def empty?
    return @stack.length === 0
  end
end
