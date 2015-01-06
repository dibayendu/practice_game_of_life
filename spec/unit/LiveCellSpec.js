describe("LiveCell", function() {
    var liveCellInstance ;
    var deadCellInstance;
    beforeEach(function () {
        var LiveCell = require('../../src/LiveCell');
        var DeadCell = require('../../src/DeadCell');
        liveCellInstance = LiveCell.getInstance();
        deadCellInstance = DeadCell.getInstance();
    });

    it ("cell is alive", function () {
        expect(liveCellInstance.isAlive()).toBe(true);
    });

    it ("#toString prints character", function () {
        expect(liveCellInstance.toString()).toEqual('x');
    });

    it ("#toStringGrid prints character", function () {
        expect(liveCellInstance.toStringGrid()).toEqual('| x ');
    });

    it ("dead nextGeneration with 1 neighbour", function () {
        expect(liveCellInstance.nextGeneration(1)).toEqual(deadCellInstance);
    });

    it ("alive nextGeneration with 2 neighbours", function () {
        expect(liveCellInstance.nextGeneration(2)).toEqual(liveCellInstance);
    });

    it ("alive nextGeneration with 3 neighbours", function () {
        expect(liveCellInstance.nextGeneration(3)).toEqual(liveCellInstance);
    });

    it ("dead nextGeneration with 4 neighbours", function () {
        expect(liveCellInstance.nextGeneration(4)).toEqual(deadCellInstance);
    });
});

