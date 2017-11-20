class Node
  attr_accessor :value, :parent, :left, :right
  
  def initialize(value, left = nil, right = nil)
    @value = value
	@left = left
	@right = right
  end
  
end

class Bin_Tree
@root
  def initialize(root = nil)
    @root = root
  end
  
  def build_tree(arr)
    @root = Node.new(arr[0])
    s = arr.size
    i = 1
    while i < s
      nodey = Node.new(arr[i])
      insert(nodey)	  
      i += 1
    end
  end

  def insert (node, root = @root)
  
    if root.value >node.value
      if root.left == nil 
        root.left = node
	    node.parent = root
	  else
	    insert(node, root.left)
	  end
    end
    if root.value <= node.value
      if root.right == nil 
        root.right = node
	    node.parent = root
	  else
	    insert(node, root.right)
	  end
    end
  end 


  def breadth_first_search(find)
    root = @root
    queue = [root]
    while queue.length > 0
      if queue[0].value == find 
	    return queue[0]
	  end
      queue.push(queue[0].left) unless queue[0].left == nil
	  queue.push(queue[0].right) unless queue[0].right == nil
      queue.shift
    end
    return nil 
  end

  def depth_first_search(find)
    root = @root
    stack = [root]
    while stack.length > 0
      last = stack.pop
	  if last.value == find 
	    return last
	  end
	  stack.push(last.right) unless last.right == nil
	  stack.push(last.left) unless last.left == nil 
	end
    return nil
  end

  def dfs_rec(find, node = @root)
    return if node.nil?
    if node.value == find 
	  found = node
	end
	
    left = dfs_rec(find, node.left) unless node.left.nil?
	if (left)
	  found = left
	end

    right = dfs_rec(find, node.right) unless node.right.nil?
	if (right)
	  found = right
	end
	
	return found
  end
  
  def inOrder(root = @root)
    if root
	  inOrder(root.left)
	  print root.value.to_s + " "
	  inOrder(root.right)
	end 
  end
  
  def preOrder(root = @root)
    if root
	  print root.value.to_s + " "
	  preOrder(root.left)
	  preOrder(root.right)
	end
  end
  
  def postOrder(root = @root)
    if root
	  postOrder(root.left)
	  postOrder(root.right)
	  print root.value.to_s + " "
	end
  end
  
  def layer_traversal
    root = @root
	queue = [root]
	while queue.length > 0
	queue.push(queue[0].left) unless queue[0].left = nil
	queue.push(queue[0].right) unless queue[0].right == nil
	s = queue.shift
	puts s.value
	end
	
  end
end 