def merge_sort(ary)
	if ary.length <= 1
		ary
	else
		mid = (ary.length / 2)
		left = merge_sort(ary[0..mid - 1])
		right = merge_sort(ary[mid..ary.length])
		merge(left,right)
	end
end

def merge(left,right)
	if left.empty?
		right
	elsif right.empty?
		left
	elsif left.first < right.first
		[left.first] + merge(left[1..left.length], right)
	else
		[right.first] + merge(right[1..right.length], left)
	end
end


array = Array.new(13) { rand(100) }
p merge_sort(array)