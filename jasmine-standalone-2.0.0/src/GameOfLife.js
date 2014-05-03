function Cell(alive, x, y) {
    var alive = alive;
    var x = x;
    var y = y;

    this.getY = function() {
        return y
    }
    this.getX = function() {
        return x
    }
    this.isAlive = function() {
        return alive
    }
    this.setAlive = function() {
        alive = true;
    }
    this.setDead = function() {
        alive = false;
    }
}


function Board() {}
Board.prototype.setAlive = function(cell) {
    cell.setAlive();
}

Board.prototype.setDead = function(cell) {
    cell.setDead();
}
// Cell.prototype.getY = function() {
//     return Cell.y
// };
// Cell.prototype.getX = function() {
//     return this.x
// };
// Cell.prototype.isAlive = function() {
//     return this.alive
// };