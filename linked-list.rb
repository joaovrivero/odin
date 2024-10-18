class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
    else
      current = @head
      current = current.next_node while current.next_node
      current.next_node = Node.new(value)
    end
  end

  def prepend(value)
    new_node = Node.new(value)
    new_node.next_node = @head
    @head = new_node
  end

  def size
    count = 0
    current = @head
    until current.nil?
      count += 1
      current = current.next_node
    end
    count
  end

  def tail
    current = @head
    current = current.next_node while current.next_node
    current
  end

  def at(index)
    return nil if index < 0 || index >= size

    current = @head
    index.times { current = current.next_node }
    current
  end

  def pop
    return nil if @head.nil?

    if @head.next_node.nil?
      popped_node = @head
      @head = nil
      return popped_node
    end

    current = @head
    until current.next_node.next_node.nil?
      current = current.next_node
    end
    popped_node = current.next_node
    current.next_node = nil
    popped_node
  end

  def contains?(value)
    current = @head
    until current.nil?
      return true if current.value == value

      current = current.next_node
    end
    false
  end

  def find(value)
    current = @head
    index = 0
    until current.nil?
      return index if current.value == value

      current = current.next_node
      index += 1
    end
    nil
  end

  def to_s
    current = @head
    result = ''
    until current.nil?
      result += "( #{current.value} ) -> "
      current = current.next_node
    end
    result += 'nil'
  end

  # Extra Credit

  def insert_at(value, index)
    return nil if index < 0 || index > size

    if index.zero?
      prepend(value)
    elsif index == size
      append(value)
    else
      previous_node = at(index - 1)
      new_node = Node.new(value)
      new_node.next_node = previous_node.next_node
      previous_node.next_node = new_node
    end
  end

  def remove_at(index)
    return nil if index < 0 || index >= size

    if index.zero?
      removed_node = @head
      @head = @head.next_node
      return removed_node
    else
      previous_node = at(index - 1)
      removed_node = previous_node.next_node
      previous_node.next_node = removed_node.next_node
      return removed_node
    end
  end
end

# Testing
list = LinkedList.new
list.append(1)
list.append(2)
list.append(3)
list.prepend(0)
puts list.to_s  # Output: ( 0 ) -> ( 1 ) -> ( 2 ) -> ( 3 ) -> nil
puts list.size  # Output: 4
puts list.head.value  # Output: 0
puts list.tail.value  # Output: 3
puts list.at(2).value  # Output: 2
puts list.contains?(2)  # Output: true
puts list.find(3)  # Output: 3
list.pop
puts list.to_s  # Output: ( 0 ) -> ( 1 ) -> ( 2 ) -> nil
list.insert_at(5, 2)
puts list.to_s  # Output: ( 0 ) -> ( 1 ) -> ( 5 ) -> ( 2 ) -> nil
list.remove_at(1)
puts list.to_s  # Output: ( 0 ) -> ( 5 ) -> ( 2 ) -> nil
