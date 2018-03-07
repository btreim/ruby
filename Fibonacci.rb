def fibs_rec(n)
	if n <= 2 then return n == 2 ? [0,1] : [0] end
	x = fibs_rec(n-1)
	return x << x[-1] + x[-2]
end

p fibs_rec(0) # => value 0 Base Case
p fibs_rec(1) # => value 1 Base Case 2
p fibs_rec(2) 
p fibs_rec(3)
p fibs_rec(4)



def fibs(n)
	if n == 0
		solution = [0]
	else 
		solution = [0,1]
		(n-2).times do
			solution << (solution[-2] + solution[-1])
		end
	end
	solution
end

p fibs(0)
p fibs(4)
p fibs(10)