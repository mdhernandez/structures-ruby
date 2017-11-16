class Linked_List
  @head
  
  def initialize (node = nil)
    @head = node
  end

  def append value
    current = @head
	while current.next != nil
	  current = current.next
	end
	current.next = Node.new(value, nil)
  end#adds a node at the end of list
  
  def prepend value
    nhead = Node.new(value, @head)
	@head = nhead
  end#adds a node at beginning of list
  
  def size
    count = 0
	current = @head
	while current != nil
	  current = current.next
	  count += 1
	end
	return count
  end#returns list size
  
  
  #def head
   # return @head
  #end#unnecessary?
  
  def tail
    current = @head
	while current.next != nil
	  current = current.next
	end
	return current
  end#returns node at end of the list
  
  def at index
    n = 0
	current = @head
	while current.next != nil && n < index 
	  current = current.next
	  n += 1
	end
	return current
  end#returns node at given index
  
  def pop
    current = @head
	if current == nil || current.next == nil
	  return nil
	end
	while current.next.next != nil
	  current = current.next
	end
	s = current.next
	current.next = nil
	return s
  end#removes last element
  
  
  def contains? val
    current = @head
    while current != nil
	  if current.value == val
	    return true
	  end
	  current = current.next
	end
    return false
  end#returns true if a given value is found in the list
  
  
  def find data
    index = 0
	current = @head
    while current != nil
	  if current.value == data
	    return index
	  end
	  current = current.next
	  index += 1
	end
	return nil
  end#returns index of the first node that contains a given data, or nil
  
  def return_list
    current = @head
	arr = []
	while current != nil
	  arr.push(current.value)
	  current = current.next
	end
	return arr
  end
  
  def to_s
    arr = return_list
	str = ""
	arr.each do |val|
	  str += val.to_s
	  str += " -> "
	end
	str += "nil"
	return str
  end#returns a string that represents the list
  
  
  def insert_at index, value
    current = @head
	i=0
	
	while current.next != nil && i < (index - 1)
	  current = current.next
	  i += 1
    end
	insert = Node.new(value, current.next)
	current.next = insert
  end#inserts a node at the given index
  
  def remove_at index
    current = @head
	i = 0
	while current.next !=nil && i < (index-1)
	  current = current.next
	  i += 1
	end
	current.next = current.next.next
  end#removes a node at the given index
  
end

class Node
  attr_accessor :value, :next
  def initialize(val, nex = nil)
    @value = val
	@next = nex
  end
end

def build_list(arr)
  if !arr.empty?
    i = 1
    test = Linked_List.new(Node.new(arr[0]))
    while i < arr.size
      test.append(arr[i])
	  i+=1
    end
    return test
  end
end

#some test cases

list = build_list([2, 4, 7, 8, 29, 10, 222, 393, 1])

#print list.to_s + "\n"
#puts list.size
#list.prepend(32)
#list.append(5)
#print list.to_s + "\n"
#puts list.size
#s = list.pop
#puts s.value
#puts list.to_s
#puts list.at(2).value
#puts list.tail.value
#puts list.find(7)
#puts list.contains? (1)
#puts list.contains? (2)
#list.remove_at(2)
#puts list.to_s
#list.insert_at(2, 7)
#puts list.to_s
