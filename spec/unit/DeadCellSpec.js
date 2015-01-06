describe("DeadCell", function() {
    var liveCellInstance ;
    var deadCellInstance;
    beforeEach(function () {
        var LiveCell = require('../../src/LiveCell');
        var DeadCell = require('../../src/DeadCell');
        liveCellInstance = LiveCell.getInstance();
        deadCellInstance = DeadCell.getInstance();
    });

    it ("cell is dead", function () {
        expect(deadCellInstance.isAlive()).toBe(false);
    });

    it ("#toString prints character", function () {
        expect(deadCellInstance.toString()).toEqual('.');
    });

    it ("#toStringGrid prints character", function () {
        expect(deadCellInstance.toStringGrid()).toEqual('| . ');
    });

    it ("dead nextGeneration with 1 neighbour", function () {
        expect(deadCellInstance.nextGeneration(1)).toEqual(deadCellInstance);
    });

    it ("alive nextGeneration with 2 neighbours", function () {
        expect(deadCellInstance.nextGeneration(2)).toEqual(deadCellInstance);
    });

    it ("alive nextGeneration with 3 neighbours", function () {
        expect(deadCellInstance.nextGeneration(3)).toEqual(liveCellInstance);
    });

    it ("dead nextGeneration with 4 neighbours", function () {
        expect(deadCellInstance.nextGeneration(4)).toEqual(deadCellInstance);
    });
});

