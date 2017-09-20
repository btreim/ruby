def bubble_sort(array)
	n = array.length

	loop do 
		swapped = false

		(n - 1).times do |i|
			if array[i] > array[i + 1]
				array[i], array[i + 1] = array[i + 1], array[i]
				swapped = true	
				p array
			end
		end
		break if not swapped
	end
end

array = [1,3,2,-1]

bubble_sort(array)
