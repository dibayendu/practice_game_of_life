(function () {
    'use strict';

    // Abstract class, constructor is private
    var Cell = function Cell () {

        this.toStringGrid = function toStringGrid () {
            return "| " + this.toString() + " ";
        };

        // contructor throws exception
        if (this.constructor === Cell) {
            throw new Error("Can't instantiate abstract class!");
        }
    };

    Cell.prototype.toString = function toString () {
        return this.CHARACTER;
    };

    // returns LiveCell or DeadCell
    Cell.prototype.getCell = function getCell (character) {
        var LiveCell = require('./LiveCell');
        var DeadCell = require('./DeadCell');
        var liveCellCharacter = LiveCell.CHARACTER.toLowerCase();
        if (character.toLowerCase() === liveCellCharacter) {
            return LiveCell.getInstance();
        } else {
            return DeadCell.getInstance();
        }
    };

    module.exports = Cell;
})();
