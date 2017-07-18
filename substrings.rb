dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit","below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

#wordCountHash = Hash.new

def substrings(user,dictionary)
	wordCountHash = Hash.new
	userArray = user.split(" ")
	count = 0

	userArray.each do |word| 
		if dictionary.include? (word)
			count = wordCountHash[word].to_i
			count += 1
			wordCountHash[word] = count
			count = 0

		end
	end
	p "Here are the words within the dictionary"
	p wordCountHash

end
puts "Type a phrase"
userInput = gets.chomp.downcase
substrings("#{userInput}", dictionary)
