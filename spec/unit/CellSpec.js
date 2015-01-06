describe("Cell", function() {
    var Cell;
    var liveCellInstance ;
    var deadCellInstance;
    beforeEach(function () {
        var LiveCell = require('../../src/LiveCell');
        var DeadCell = require('../../src/DeadCell');
        Cell = require('../../src/Cell');
        liveCellInstance = LiveCell.getInstance();
        deadCellInstance = DeadCell.getInstance();
    } );

    it ("instantiating Cell throws error", function () {
        expect(function () { new Cell() }).toThrow(new Error("Can't instantiate abstract class!"));
    });
});

