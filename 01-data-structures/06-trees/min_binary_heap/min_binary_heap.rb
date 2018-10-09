require_relative "node"

class MinBinaryHeap
  attr_reader :root
  attr_reader :tree

  def initialize(root)
    @root = root
    @tree = [nil, @root]
  end

  def insert(root, data)
    #push data to tree array
    @tree.push(data)
    # set index as array's length - 1
    index = @tree.length - 1
    # find the parent's index by dividing the data's new index above by 2
    parent = index / 2

    # new data is a left child if the parent exiists and index % 2 is 0
    is_data_a_left_child = @tree[parent] && index % 2 == 0


    if is_data_a_left_child
      # if it is the left child, set parents left child
      @tree[parent].left = @tree[index]
    else
      # if it is the right child, set parents right child
      @tree[parent].right = @tree[index]
    end

    # while we havent reached the top of the tree (tree[parent])
    # AND while parent is greater than its child
    while tree[parent] && is_parent_greater_than_child(index, parent)
      # swap parent and child node positions
      swap_node_position(@tree[parent], @tree[index])
      # update index and parent for re-evaluation at top of loop
      index = parent
      parent = index / 2
    end
  end

  # searches for the 'data' within the tree starting at 'root'
  # returns the node if found, returns nil otherwise
  def find(root, data)
    (1...@tree.length).each do |loc|
      if data.title == @tree[loc].title
        return @tree[loc]
      end
    end
    nil
  end

  # returns true if parent's rating is greater than child's rating
  def  is_parent_greater_than_child(index, parent)
    @tree[parent].rating > @tree[index].rating
  end

  # searches the tree for 'data' starting at 'root'
  def delete(root, data)
    # finds the data to be deleted and stores as element
    element = find(root, data)
    if element
      # if data was found
      # store what will be the new last index
      last_index = @tree.length - 1
      # store last_index's parent's index
      parent = last_index / 2
      # delete end of tree and store in last_element
      last_element = @tree.pop

      # determine if it was a left or right child
      popped_node_was_a_left_child = @tree[parent] && last_index % 2 == 0
      popped_node_was_a_right_child = @tree[parent] && last_index % 2 != 0

      # set appropriate child as nil
      if popped_node_was_a_left_child
        @tree[parent].left = nil
      elsif popped_node_was_a_right_child
        @tree[parent].right = nil
      end

      # re-set the 'deleted' element's title and rating,
      # effectively removing it and replacing it with what was the last node
      element.title = last_element.title
      element.rating = last_element.rating
    else
      # data was not found, return nil
      return nil
    end

    # filter the newly placed node up or down to where it should be in the heap
    filter_down(element)
    filter_up(element)
  end

  # filters an element down the tree
  def filter_down element
    left_child_is_less_than_element = element.left && element.left.rating < element.rating
    right_child_is_less_than_element = element.right && element.right.rating < element.rating

    while left_child_is_less_than_element or right_child_is_less_than_element
      lower_rated_element = nil
      if left_child_is_less_than_element
        lower_rated_element = element.left
      elsif right_child_is_less_than_element
        lower_rated_element = element.right
      end
      element = swap_node_position(element, lower_rated_element)
      left_child_is_less_than_element = element.left && element.left.rating < element.rating
      right_child_is_less_than_element = element.right && element.right.rating < element.rating
    end
  end

  # filters an element up the tree
  def filter_up(element)
    element_index = @tree.index(element)
    parent = element_index / 2
    element_is_greater_than_child = @tree[parent] && @tree[parent].rating > element.rating
    while element_is_greater_than_child
      swap_node_position(@tree[parent], element)
      parent = element_index / 2
      element_is_greater_than_child = @tree[parent] && @tree[parent].rating > element.rating
    end
  end

  # swaps the title and rating of the higher_node with that of the lower_node
  # returns the lower_node
  def swap_node_position(higher_node, lower_node)
    temp_element_title = higher_node.title
    temp_element_rating = higher_node.rating
    higher_node.title = lower_node.title
    higher_node.rating = lower_node.rating
    lower_node.title = temp_element_title
    lower_node.rating = temp_element_rating
    lower_node
  end

  # runs through the tree and checks for a node, printing its title and rating if found
  def print(root)
    root_index = @tree.index(root)
    temp_tree = @tree[root_index..-1]
    temp_tree.each do |n|
      if n
        puts n.title + ": " + n.rating.to_s
      end
    end
  end
end
