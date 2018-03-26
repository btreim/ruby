class StringCalculator
	def self.add(input)
		if input.empty?
			0
		else
			numbers = input.split(",").map{|num| num.to_i}
			numbers.inject { |mem, num| mem + num  }
		end
	end

end