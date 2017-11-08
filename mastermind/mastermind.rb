require_relative 'setter.rb'
require_relative 'guesser.rb'
require_relative 'computer.rb'

TURN_LIMIT = 12
COMBO_LENGTH = 4
computer = nil
setter = Setter.new
guesser = nil
correct_position = 0
correct_nums = 0
turn_num = 1

def with_user_nums
	choice = Array.new
	until choice.length == COMBO_LENGTH
		num = gets.chomp.to_i
		if (1..6).include?(num)
			choice << num
		else
			puts "Please put a number 1-6."
		end
	end
	choice
end

def with_comp_nums(*setter_num_array, guesser)
	choice = Array.new

	if guesser.user_guess.empty?
		COMBO_LENGTH.times do |num|
		num = 1 + rand(6)
		choice << num
		end
	else
		setter_num_array.each_with_index do |num, index| 
			if num == guesser.last_guess[index] 
				choice[index] = guesser.last_guess[index]
			else
				choice[index] = 1 + rand(6)
			end
		end
	end
	choice
end


puts "Time to play mastermind!" 
puts "Would you like to guess against the computer? (Y or N)"

#SET COMPUTER 

until computer == true || computer == false
	computer = gets.chomp.upcase
	if computer == "Y"
		computer = true
		guesser = Guesser.new
	elsif computer == "N"
		computer = false
		guesser = Computer.new
	else
		puts "Please input Y or N"
	end
end
	 	 

#MANUAL OR AUTO SET COMBO? 

if computer
	puts "You are guessing against the computer."
	setter.rand_generate
else
	puts "You are setting the winning combination."
	puts "To set the winning combo, one at a time, input a combination #{COMBO_LENGTH.to_s} numbers in length, consisting of numbers 1-6."
	setter.set_array(*with_user_nums)
end

#GAME START

until guesser.last_guess == setter.num_array || guesser.turn > TURN_LIMIT
	puts "Please guess the combo. You have #{TURN_LIMIT.to_i - (guesser.turn - 1)} turn(s) left."
	puts "One at a time, guess a combination #{COMBO_LENGTH.to_s} numbers in length, consisting of numbers 1-6."
	computer ? guesser.make_guess(*with_user_nums) : guesser.make_guess(*with_comp_nums(*setter.num_array, guesser))
	sleep(0.5)
	turn_num += 1

	guesser.user_guess.each do |x,y|
		p "Guess ##{x}: #{y}"
	end

	#CHECK CORRECT POSITION
	correct_position = guesser.check_correct_position(setter.num_array)
	#CHECK CORRECT NUMBERS
	correct_nums = guesser.correct_nums(setter.num_array)
	puts correct_position == COMBO_LENGTH ? "You Win!" : "You have #{correct_position} numbers in the correct position, and #{correct_nums} correct numbers."
end

if guesser.turn > TURN_LIMIT
	puts "YOU LOSE, LOSER."
	puts "The correct combo was: #{setter.num_array}"
end









