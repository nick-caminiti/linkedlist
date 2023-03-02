class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(value)
    if @head == nil
      @head = Node.new(value)
    else
      current_node = @head
      current_node = current_node.next_node until current_node.next_node == nil
      current_node.next_node = Node.new(value)
    end
  end

  def prepend(value)
    if @head == nil
      @head = Node.new(value)
    else
      @head = Node.new(value, @head)
    end
  end
  
  def size
    if @head == nil
      count = 0
    else
      count = 1
      current_node = @head
      until current_node.next_node == nil
        current_node = current_node.next_node
        count += 1
      end
    end
    count
  end

  def tail
    if head == nil
      nil
    else
      current_node = @head
      current_node = current_node.next_node until current_node.next_node == nil
      current_node
    end
  end
  
  def pop
    if head == nil
      nil
    else
      current_node = @head
      current_node = current_node.next_node until current_node.next_node.next_node == nil
      current_node.next_node = nil
    end
  end

  def at(index)
    if @head == nil
      nil
    else
      count = 0
      current_node = @head
      until count == index
        current_node = current_node.next_node 
        count +=1
      end
      current_node
    end
  end

  def contains(value)
    current_node = @head
    contains = false
    until current_node.next_node == nil
      contains = true if current_node.value == value
      break if contains
      current_node = current_node.next_node
    end
    contains
  end

  def find(value)
    if self.contains(value)
      index = 0
      current_node = @head  
      until current_node.next_node == nil
        break if current_node.value == value
        current_node = current_node.next_node
        index += 1
      end
      index
    else
      nil
    end
  end

  def to_s
    string = ''
    current_node = @head
    until current_node.next_node == nil
      string += "( #{current_node.value.to_s} ) -> "
      current_node = current_node.next_node
    end
    string += "( #{current_node.value.to_s} ) -> nil"
    string
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

list = LinkedList.new
p list
p list.size
list.append('number 2')
p list
p list.size
list.append('number 3')
p list
p list.size
list.append('number 4')
p list
p list.size
list.prepend('number 1')
p list
p list.size
puts list.head
puts list.tail
puts list.at(1)
p 'pop'
list.pop
p list
p list.size
p list.contains('number 1')
p list.contains('number 4')
p list.find('number 1')
p list.find('number 4')
p list.to_s