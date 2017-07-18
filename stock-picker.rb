
a = [1, 2, 3, 4, 5, 6, 7, 8, 9]
b = [9, 8, 7, 6, 5, 4, 3, 2, 1]
c = [3, 4, 2, 6, 7, 4, 9, 8, 5]
d = [8, 6, 9, 2, 7, 4, 1, 5 ,1]
e = [10, 11, 2, 9, 4, 3, 5, 6]
f = [17, 3, 6, 9, 15, 8, 6, 1, 10]


def stock_picker(array)
	max = array.max
	maxIndex = array.index(max)
	min = array.min
	minIndex = array.index(min)

	if maxIndex == 0 && array.length > 1
		array.slice!(0)
		stock_picker(array)

	elsif max == array.last
		puts "You were not able to sell. You bought for $#{max} on the last day."
				
	else
		array.slice!((maxIndex+1)..-1)
		newMax = array.max
		newMin = array.min
		puts "You bought at $#{newMin} and sold at $#{newMax} for a profit of $#{newMax-newMin}."
	end
end


stock_picker(a)
stock_picker(b)
stock_picker(c)
stock_picker(d)
stock_picker(e)
stock_picker(f)