class Node
  attr_accessor :value, :left, :right
  
  def initialize value
    @value  = value
    @left   = nil
    @right  = nil
  end

  def insert value
    # child smaller than parent, insert left
    # child larger than parent, insert right
    if value <= @value
      @left.nil? ? @left = Node.new(value) : @left.insert(value)
    else
      @right.nil? ? @right = Node.new(value) : @right.insert(value)
    end
  end

  def display
    print "Value: #{@value}, L: #{@left}, R: #{@right}\n"
  end

end

class Tree
  def build_tree array
    root = Node.new(array.shift)
    array.each { |item| root.insert(item) }
    root
  end

  def breadth_first_search root, target
    queue = [root]
    unless queue.empty?
      current = queue.shift

      # Return value if found
      return current if current.value == target

      # Add children to the queue, if they exist
      queue << current.left if !current.left.nil?
      queue << current.right if !current.right.nil?
    end
    nil
  end

  def depth_first_search root, target
    stack = [root]

    unless stack.empty?
      current = stack.pop

      return current if current.value == target

      stack << current.left if !current.left.nil?
      stack << current.right if !current.right.nil?
    end
    nil
  end

  def dfs_rec root, target
    return nil if root.nil?
    return root if root.value == target

    left = dfs_rec(root.left, target)
    right = dfs_rec(root.right, target)
    left or right
  end
end

array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
bst = Tree.new
tree = bst.build_tree(array)

p tree.breadth_first_search(tree, 23)
p "\n"
p tree.depth_first_search(tree, 7)
p "\n"
p tree.dfs_rec(tree, 6345)