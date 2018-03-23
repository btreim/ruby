class ChessBoard
	attr_reader :cell_positions

	def initialize
		create_cells
	end

	def create_cells
		@cell_positions = []
		0.upto(7) { |a| 0.upto(7){ |b| @cell_positions << [a,b]}}
	end

	def possible_moves_from(current_pos, possible = [])
		move_1 = [(current_pos[0] + 2 ), (current_pos[1] + 1)] # Up and to the right
		move_2 = [(current_pos[0] + 2 ), (current_pos[1] - 1)] # Up and to the left
		move_3 = [(current_pos[0] - 2 ), (current_pos[1] + 1)] # Down and to the right
		move_4 = [(current_pos[0] - 2 ), (current_pos[1] - 1)] # Down and to the left
		move_5 = [(current_pos[0] + 1 ), (current_pos[1] + 2)] # Right and to the right
		move_6 = [(current_pos[0] - 1 ), (current_pos[1] + 2)] # Right and to the left
		move_7 = [(current_pos[0] + 1 ), (current_pos[1] - 2)] # Left and to the right
		move_8 = [(current_pos[0] - 1 ), (current_pos[1] - 2)] # Left and to the left

		moves = [move_1, move_2, move_3, move_4, move_5, move_6, move_7, move_8]

		moves.each do |move| 
			if @cell_positions.include?(move)
				possible << move
			end
		end
		return possible
	end

	def shortest_path_from(current_pos, target, path = [], search_queue = [], search_hash = Hash.new, root=nil)
		if @root.nil? 
			@root = current_pos
		end

		search_hash[current_pos] = possible_moves_from(current_pos)

		if search_hash[current_pos].include?(target)
			path << target
			until path.include?(@root)
				shortest_path_from(@root, current_pos, path)
			end
			return "You made it in #{path.size - 1} moves! Here's your path: #{path.reverse}"
		else
			search_hash.values.each {|value| value.each {|value| search_queue << value}}
			current_pos = search_queue.shift
			shortest_path_from(current_pos,target,path,search_queue,search_hash)
		end
	end
end


x = ChessBoard.new
puts x.shortest_path_from([0,3],[5,7])