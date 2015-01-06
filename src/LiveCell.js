(function () {
    'use strict';

    var Cell = require('./Cell');

    // Singleton object
    var LiveCell = (function LiveCell () {

        var Instance = function Instance () {
            // private
            var alive = true;

            // Parent constructor, inheritance
            Cell.call(this);

            // This is a class, so it should be called with 'new'
            if (!(this instanceof Instance)) {
                return new Instance(); // if 'new' is missed
            }

            // public getter
            this.isAlive = function () {
                return alive;
            };
        };

        // private
        var instance;

        // Inheritance
        Instance.prototype = Object.create(Cell.prototype)
        // Since Cell is abstract class, its constructor is private
        Instance.prototype.constructor = Instance;
        Instance.prototype.CHARACTER = 'x';
        Instance.prototype.nextGeneration = function nextGeneration (neighboursCount) {
            if (neighboursCount > 1 && neighboursCount < 4) {
                return instance;
            } else {
                var DeadCell = require('./DeadCell');
                return DeadCell.getInstance();
            }
        };

        // Singleton
        return {
            getInstance: function getInstance () {
                if (!instance) {
                    instance = new Instance();
                }
                return instance;
            }
        };
    })();

    module.exports = LiveCell;
})();
