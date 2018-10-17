require_relative 'node'

class BinarySearchTree
  attr_reader :root

  def initialize(root)
    @root = root
  end

  # Using Depth First Search
  def insert(root, node)
    if node.rating > root.rating
      root.right.nil? ? root.right = node : insert(root.right,node)
    else
      root.left.nil? ? root.left = node : insert(root.left,node)
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    if root && root.title == data
      root
    elsif root.right
      root.right.title != data ? find(root.right, data) : root.right
    elsif root.left
      root.left.title != data ? find(root.left, data) : root.left
    else
      nil
    end
  end

  def delete(root, data)
    node = find(root, data)
    if root == nil || data == nil
      return nil
    end
    if node.rating < root.rating
      root.left = delete(root.left, data)
    elsif node.rating > root.rating
      root.right = delete(root.right, data)
    else
      if root.left == nil && root.right == nil
        root = nil
      elsif root.right == nil
        return root.left
      elsif root.left == nil
        return root.right
      else
        root = findmin(root.right)
        return root
      end
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    queue = [@root]
    results = []
    while queue.length > 0
      root = queue.shift
      if root.left != nil
        queue.push(root.left)
      end
      if root.right != nil
        queue.push(root.right)
      end
      results.push("#{root.title}: #{root.rating}")
    end
    results.each {|r| puts r}
  end

  private

  def findmin(root)
    if root.left == nil
      return root
    else
      findmin(root.left)
    end
  end
end
