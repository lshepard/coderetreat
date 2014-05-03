require 'rspec'
require_relative 'blah'

class Cell
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def neighbor_set
    Set.new([[x-1,y-1],
    [x,y-1],
    [x+1,y-1],
    [x-1,y],
    [x+1,y],
    [x-1,y+1],
    [x,y+1],
    [x+1,y+1]])
  end

  def live?(neighbor_hash)
    neighbors = neighbor_hash[[x,y]] || 0
    neighbors == 2 || neighbors == 3
  end
end

class Board
  attr_accessor :cells

  def initialize(cells)
    @cells = cells
  end

  def neighbor_hash
    neigh_hash = {}
    @cells.each do |cell|
      cell.neighbor_set.each do |position|
        neigh_hash[position] ||= 0
        neigh_hash[position] += 1
      end
    end
    neigh_hash
  end

  def tick
    neighbors = neighbor_hash
    # @cells.select! do |cell|
      # cell.live?(neighbors)
    # end

    neighbors.select do |key,val|
      val == 3
    end.each do |position|
      @cells << Cell.new(*position)
    end
  end
end

describe Something do
	it "assert true is true" do
		expect(true).to eq(true)
	end
end

describe Cell do
  describe "#init" do
    it "takes a position" do
      c = Cell.new(0,0)
      expect(c.x).to eq(0)
      expect(c.y).to eq(0)
    end
  end

  describe "#neighbor_set" do
    it "returns a set with neighboring coordinates and values of 1" do
      c = Cell.new(1,1)
      expect(c.neighbor_set).to eq(
        Set.new([
          [1,0],[1,0],[1,2],
          [2,2],[2,1],[2,0],
          [0,0],[0,1],[0,2]
        ])
      )
    end
  end

  describe "live?" do
    it "Any live cell with fewer than two live neighbours dies, as if caused by under-population." do
      b = Board.new([Cell.new(0,0)])
      cell = b.cells.first
      expect(cell.live?(b.neighbor_hash)).to eq(false)
    end

    it "Any live cell with two or three live neighbours lives on to the next generation." do
      b = Board.new([Cell.new(0,0), Cell.new(1,1), Cell.new(1,0)])
      cell = b.cells.first
      expect(cell.live?(b.neighbor_hash)).to eq(true)   
      b = Board.new([Cell.new(0,0), Cell.new(1,1), Cell.new(1,0), Cell.new(0,1)])
      cell = b.cells.first
      expect(cell.live?(b.neighbor_hash)).to eq(true) 
    end

    it "Any live cell with more than three live neighbours dies, as if by overcrowding." do
      b = Board.new([Cell.new(0,0), Cell.new(1,1), Cell.new(1,0), Cell.new(0,1), Cell.new(-1,-1)])
      cell = b.cells.first
      expect(cell.live?(b.neighbor_hash)).to eq(false)   
    end

  end
end

describe Board do
  describe "#cells" do
    it "returns a list of cells" do
      b = Board.new([Cell.new(0,0)])
      expect(b.cells.count).to eq(1)
    end
  end

  describe "#neighbor_hash" do
    it "returns a hash of neighbor counts" do
      b = Board.new([Cell.new(1,1), Cell.new(1,2)])
      expect(b.neighbor_hash).to eq({
        [0,0] => 1,
        [0,1] => 2,
        [0,2] => 2,
        [0,3] => 1,

        [1,0] => 1,
        [1,1] => 1,
        [1,2] => 1,
        [1,3] => 1,

        [2,0] => 1,
        [2,1] => 2,
        [2,2] => 2,
        [2,3] => 1
      })
    end
  end

	describe "#tick" do

    it "Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction." do
      b = Board.new([Cell.new(1,1), Cell.new(1,0), Cell.new(0,1)])
      b.tick

      puts "Cells: #{b.cells.inspect}"
      expect(b.cells.count).to eq(4)
    end
  end

  it "doesn't create new cells where one already exists"
  it "..."
end

