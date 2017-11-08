class Guesser
	def initialize
		@guesses = Hash.new
		@turn_num = 1 
	end

	def turn
		@turn_num
	end

	def user_guess
		@guesses
	end

	def last_guess
		@guesses[@turn_num - 1]
	end

	def make_guess(*user_guess)
		@guesses[@turn_num] = user_guess
		@turn_num += 1
	end

	def check_correct_position(setter_num_array)
		correct = 0
			setter_num_array.each_with_index do |num, index| 
			if num == self.last_guess[index] 
				correct += 1
			end
		end	
		return correct
	end

	def correct_nums(setter_num_array)
		correct = 0
			self.last_guess.each do |num|
			if setter_num_array.include?(num)
				correct += 1
			end
		end
		return correct
	end
end
