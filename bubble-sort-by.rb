def bubble_sort_by(array)

	index_position = 0

	while index_position < (array.length-1)

		 	if yield(array[index_position], array[index_position+1]) > 0 
			 	array[index_position], array[index_position+1] = array[index_position+1], array[index_position]
			 	puts array[index_position], array[index_position+1]

			 else
			 	 puts array[index_position]

			end
		index_position += 1
	end
end




bubble_sort_by(["hi","hello","hey"]) do |left,right|
left.length - right.length
end

# => ["hi", "hey", "hello"]
	