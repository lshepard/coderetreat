class Board
	attr_reader :state_array
	def initialize(state_array)
		@state_array = state_array
	end

	def cell(x,y)
		state_array[y][x]
	end

	def next_state
		Board.new(state_array.map do |row|
			row.map do |cell|
				transform_cell(cell)
			end
		end)
	end

	def transform_cell(cell)
		0
	end

	def to_s
		@state_array.map(&:join).join("\n")
	end	

end


class Cell
	attr_reader :live_neighbor_count
	def initialize(alive: false, live_neighbor_count: 0)
		@alive = alive
		@live_neighbor_count = live_neighbor_count
	end

	def alive?
		@alive
	end


end
