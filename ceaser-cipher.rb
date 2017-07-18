def caeser_cipher(someString, shift)
	letter = someString.split("")
	upCase= ("A".."Z").to_a
	lowCase = ("a".."z").to_a
	encoded = Array.new
		letter.each do |x|
			if upCase.include?(x)
				index = upCase.index(x)
				newNum = index.to_i + shift.to_i
					if newNum > 25
						newNum = newNum - 25
					end
				newLet = upCase[newNum]

				encoded << newLet

			elsif lowCase.include?(x)
				index = lowCase.index(x)
				newNum = index.to_i + shift.to_i
					if newNum > 25
						newNum = newNum - 25
					end
				newLet = lowCase[newNum]

				encoded << newLet	
					
			else
				encoded << x
			end
		end
	puts "Here is your encoded phrase: " + encoded.join("")
end
	
puts "What phrase would you like to encode?"
phrase = gets.chomp
puts "Please input an offset (1-25)"
shift = gets.chomp
caeser_cipher("#{phrase}","#{shift}".to_i)

