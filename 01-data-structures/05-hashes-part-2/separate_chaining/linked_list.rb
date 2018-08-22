require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    @head = node if @head.nil?

    if @tail.nil?
      @tail = node
    else
      @tail.next = node
      @tail = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    # Case : No Head / No Tail
    return nil if @head.nil?
    # Case :  Head = Tail
    if @head === @tail
      @head = nil
      @tail = nil
      return nil
    end
    # Case : Head / (Body) / Tail
    temp = @head
    temp = temp.next while temp.next != @tail
    @tail = temp
  end

  # This method prints out a representation of the list.
  def print
    temp = @head
    myString = temp.data.to_s + "\n"
    until temp.next.nil?
      temp = temp.next
      myString = myString + temp.data.to_s + "\n"
    end
    puts myString
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    temp = @head
    prev = @head
    while temp != node
      prev = temp
      temp = temp.next
    end
    prev.next = temp.next
    @head = @head.next if @head === node
    set_tail
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    temp = node
    temp.next = @head
    @head = temp
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    @head = @head.next
  end

  private

  def set_tail
    temp = @head
    temp = temp.next until temp.next.nil?

    @tail = temp
  end
end
