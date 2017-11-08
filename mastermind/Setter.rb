class Setter
	def initialize
		@num_array = Array.new
	end

	def num_array
		@num_array
	end

	def rand_generate
		COMBO_LENGTH.times do |num|
			num = 1 + rand(6)
			@num_array << num
		end
	end

	def set_array(*userset)
		@num_array = userset
	end
end
