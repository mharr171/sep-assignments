class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
  end

  def enqueue(element)
    @queue.empty? ? @queue[0] = element : @queue[@queue.length] = element
    @head = @queue.first
    @tail = @queue.last
  end

  def dequeue
    @queue = @queue[1..-1]
    @queue.empty? ? @head = nil : @head = @queue.first
    @queue.empty? ? @tail = nil : @tail = @queue.last
  end

  def empty?
    return @queue.length === 0
  end
end
