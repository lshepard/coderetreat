require_relative 'board'

describe "Board" do
  let(:board){Board.new([[0,0,0],[0,1,0],[0,0,0]])}

  it "creates a board with a given state" do
  	board.cell(1,1).should eq(1)
  	board.cell(0,1).should eq(0)
  end

  it "produces another board when it moves" do
  	board.next_state.class.should eq(Board)
  end

  it "prints the board" do
  	board.to_s.should eq("000\n010\n000")
  end

  context "follows rule where any cell with fewer than 2 living neighbors dies" do

  	let(:board1) {Board.new([[0,0],[0,1]])}
  	let(:board2) {Board.new([[1,1],[1,1]])}

  	it "kills cell with fewer than two live neighbors" do
  		board1.next_state.cell(1,1).should eq(0)
  	end


  end

end

describe "Cell" do
	let(:cell){ Cell.new(alive: true) }

	it "knows whether it's alive or dead" do 
		cell.alive?.should be_true
	end

	context "with 2 neighbors" do
		let(:cell) {Cell.new(alive: true, live_neighbor_count: 2)}

		it "knows how many live neighbors it has" do
			cell.live_neighbor_count.should eq(2)
		end

		it "should live" do
			cell.alive_next_turn?.should eq(true)
		end
	end

	context "with 1 neighbor" do
		let(:cell) {Cell.new(alive: true, live_neighbor_count: 1)}

		it "knows how many live neighbors it has" do
			cell.live_neighbor_count.should eq(2)
		end

		it "should live" do
			cell.alive_next_turn?.should eq(true)
		end
	end

end