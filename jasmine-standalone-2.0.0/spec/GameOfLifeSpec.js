describe("Cell", function() {
    var cell;
    beforeEach(function() {
        cell = new Cell(true, 2, 3);
    });

    it("should be alive", function() {
        console.log(cell.getX());
        expect(cell.isAlive()).toBe(true);
    });

    it("should know its coords", function() {
        expect(cell.getX()).toEqual(2);
        expect(cell.getY()).toEqual(3);
    });

});

describe("Board", function() {
    var board;
    beforeEach(function() {
        board = new Board();

    });

    it("set alive cell", function() {
        var cell = new Cell(false, 3, 5);
        board.setAlive(cell);
        expect(cell.isAlive()).toBe(true);
    });

    it("set dead cell", function() {
        var cell = new Cell(true, 4, 8);
        board.setDead(cell);
        expect(cell.isAlive()).toBe(false);
    });

    it("find neighbors"),
    function() {
        var cell = new Cell(true, 5, 4);
        var cell2 = new Cell(true, 4, 4
            var cell[] = board.areNeighbors(cell); expect()
        });
});