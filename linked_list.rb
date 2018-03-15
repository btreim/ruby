class LinkedList
	attr_accessor :size, :head, :tail

	def initialize
		@head = nil
		@tail = nil
		@size = 0
	end

	def append(data) # adds a new node to the end of the list
		node = Node.new(data)
		if @head.nil?
			@head = node
		else
			@tail.next = node
		end

		@tail = node
		@size += 1
	end

	def prepend(data) # adds new node to the start of list
		node = Node.new(data)
		if @head.nil?
			@head = node
			@tail = node
		else 
			node.next = @head
		end
		@head = node
		@size += 1
	end

	def size # returns the total number of nodes in the list
		@size
	end

	def head # returns the first node in the list
		@head
	end

	def tail # returns the last node in the list
		@tail
	end

	def at(index) # returns the node at the given index
		return nil if index < 0 || index > @size
			current_node = @head
			index.times { current_node = current_node.next }
			current_node
	end

	def pop # removes the last element from the list
		current_node = @head
		if @size <= 1
			@head = nil
			@tail = nil
			@size = 0
		else
			until current_node.next == @tail
				current_node = current_node.next
			end
			current_node.next = nil
			@tail = current_node
			@size -= 1
		end
	end

	def contains?(value) #returns true if the passed in value is in the list, else false
		current_node = @head
		@size.times do 
			if current_node.data == value
				return true
				break
			else
				current_node = current_node.next
			end
		end
		false
	end
		
	def find(value) #retunrs the index of the node containing data, or nil if not found
		current_node = @head
		tmp_size = 1
		@size.times do 
			if current_node.data == value
				return tmp_size
			else
				tmp_size += 1
				current_node = current_node.next
			end
		end
		return nil
	end

	def to_s # to represnt your LinkedList object as a string. Format: ( data ) -> ( data ) -> nil
		array =[]
		current_node = @head
		@size.times do 
			array << current_node.data
			current_node = current_node.next
		end
		array << "nil"
		array.join(" -> ")
	end

end

class Node
	attr_accessor :data, :next
	def initialize(data = nil)
		@data = data
		@next = nil
	end
end

list = LinkedList.new
list.append("Second")
list.prepend("First")
list.append("Third")
