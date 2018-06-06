
class BinaryTree
  attr_accessor :root
  def initialize(data = nil)
    @root = nil
    @size = 0
    if data.is_a? Array
      split(data)
    else
      build_tree(data)
    end
  end

  def split(data)

    mid = (data.size / 2)
    if data.size == 1
      data = data[0]
      build_tree(data)
    elsif data.size <= 0
      nil
    else
      split(data[0..mid - 1])
      split(data[mid..-1])
    end
  end

  def build_tree(value)
    if @root.nil?
      @root = Node.new(value, nil)
      puts "Tree Root: #{@root.value}"
    else
      sort(value, @root)
    end
    @size += 1
  end


  def sort(value, current_node)
    if (value < current_node.value) && (current_node.left == nil)
      current_node.left = Node.new(value, current_node)
      puts "Inserting: #{value}"
    elsif (value >= current_node.value) && (current_node.right == nil)
      current_node.right = Node.new(value, current_node)
      puts "Inserting: #{value}"
    elsif (value < current_node.value)
      sort(value, current_node.left)
    elsif (value >= current_node.value)
      sort(value, current_node.right)
    end
  end

  def depth_first_search(input)
    search_stack = Array.new
    search_stack << @root
    current_node = @root
    until search_stack.empty? && current_node.nil?
      #Traverse Left
      until current_node.nil?
        search_stack << current_node
        current_node = current_node.left
      end
      #Print Data
      current_node = search_stack.pop
      if current_node.value == input
        return current_node
      else
        #Traverse Right
        current_node = current_node.right
      end
    end
  end

  def dfs_rec(input, current_node = nil)
    if current_node == nil
      current_node = @root
    end

    if input == current_node.value
      return current_node
    end
    left = dfs_rec(input, current_node.left) if current_node.left
    return left if left != nil
    right = dfs_rec(input, current_node.right) if current_node.right
    return right if right != nil
  end

  def breadth_first_search(input)
    search_queue = Array.new
    search_queue << @root
    current_node = @root

    until search_queue.empty? && current_node.nil?
      if input == current_node.value
        return current_node
      else
        search_queue << current_node.left if !current_node.left.nil?
        search_queue << current_node.right if !current_node.right.nil?
        current_node = search_queue.shift
      end
    end
  end

end


class Node
  attr_accessor :value, :parent, :left, :right

  def initialize(value = nil, parent = nil)
    @left = nil
    @right = nil
    @value = value
  end
end



array = [5,-1,10,0,23,21,49,100,523,23,1,590,84]
tree = BinaryTree.new(array)
